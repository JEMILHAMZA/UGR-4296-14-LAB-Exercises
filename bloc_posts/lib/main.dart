import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post CRUD Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client()),
        child: HomePage(),
      ),
    );
  }
}

class Post {
  final int id;
  String title;
  String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  void update({String? title, String? body}) {
    this.title = title ?? this.title;
    this.body = body ?? this.body;
  }
}

class EditPost extends PostEvent {
  final Post post;

  EditPost(this.post);
}

class DeletePost extends PostEvent {
  final Post post;

  DeletePost(this.post);
}

abstract class PostEvent {}

class FetchPosts extends PostEvent {}

abstract class PostState {}

class PostInitial extends PostState {}

class PostsLoaded extends PostState {
  final List<Post> posts;

  PostsLoaded(this.posts);
}

class PostError extends PostState {
  final String errorMessage;

  PostError(this.errorMessage);
}

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;
  int _currentPostId = 1; // Keep track of the next post ID to fetch

  PostBloc({required this.httpClient}) : super(PostInitial()) {
    on<FetchPosts>(_mapFetchPostsToState);
    on<EditPost>(_mapEditPostToState); // Registering the EditPost event handler
    on<DeletePost>(
        _mapDeletePostToState); // Registering the DeletePost event handler
  }

  Future<void> _mapFetchPostsToState(
      FetchPosts event, Emitter<PostState> emit) async {
    try {
      final response = await httpClient.get(Uri.parse(
          'https://jsonplaceholder.typicode.com/posts/$_currentPostId'));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final post = Post.fromJson(jsonData);

        if (state is PostsLoaded) {
          // Add the new post to the existing list
          final posts = [...(state as PostsLoaded).posts, post];
          emit(PostsLoaded(posts));
        } else {
          // Initial fetch, create a new list with the single post
          emit(PostsLoaded([post]));
        }

        _currentPostId++; // Increment for the next fetch
      } else {
        throw Exception('Failed to load post');
      }
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  void _mapEditPostToState(EditPost event, Emitter<PostState> emit) {
    if (state is PostsLoaded) {
      final updatedPosts = (state as PostsLoaded).posts.map((post) {
        if (post.id == event.post.id) {
          // Create a new Post object with updated values:
          return Post(
            id: post.id,
            title: event.post.title,
            body: event.post.body,
          );
        } else {
          return post;
        }
      }).toList();
      emit(PostsLoaded(updatedPosts));
    }
  }

  void _mapDeletePostToState(DeletePost event, Emitter<PostState> emit) {
    if (state is PostsLoaded) {
      final updatedPosts = (state as PostsLoaded)
          .posts
          .where((post) => post.id != event.post.id)
          .toList();
      emit(PostsLoaded(updatedPosts));
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return _buildInitialMessage(context);
          } else if (state is PostsLoaded) {
            if (state.posts.isEmpty) {
              return _buildEmptyMessage(context);
            } else {
              return _buildPostsList(context, state.posts);
            }
          } else if (state is PostError) {
            return Center(
              child: Text('Failed to fetch posts: ${state.errorMessage}'),
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.add(FetchPosts());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildInitialMessage(BuildContext context) {
    return Center(
      child: Text('Press the + button to get some data'),
    );
  }

  Widget _buildEmptyMessage(BuildContext context) {
    return Center(
      child: Text('No data available. Press the + button to fetch data'),
    );
  }

  Widget _buildPostsList(BuildContext context, List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _editPost(context, post);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deletePost(context, post);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editPost(BuildContext context, Post post) {
    final TextEditingController titleController =
        TextEditingController(text: post.title);
    final TextEditingController bodyController =
        TextEditingController(text: post.body);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(labelText: 'Body'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Dispatch the EditPost event with the updated post
                BlocProvider.of<PostBloc>(context).add(EditPost(Post(
                  id: post.id,
                  title: titleController.text,
                  body: bodyController.text,
                )));
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deletePost(BuildContext context, Post post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Post'),
          content: Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Dispatch the DeletePost event with the post to be deleted
                BlocProvider.of<PostBloc>(context).add(DeletePost(post));
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
