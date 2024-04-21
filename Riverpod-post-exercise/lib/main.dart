import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Model for Post
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// State Management with Riverpod
final postProvider = StateNotifierProvider<PostNotifier, PostState>((ref) {
  return PostNotifier();
});

class PostState {
  final List<Post> posts;
  final bool isLoading;
  final String error;

  PostState({this.posts = const [], this.isLoading = false, this.error = ''});

  PostState copyWith({List<Post>? posts, bool? isLoading, String? error}) {
    return PostState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(PostState());

  int _nextPostId = 1;

  Future<void> fetchPost() async {
    // state = state.copyWith(isLoading: true, error: '');
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$_nextPostId'),
      );
      if (response.statusCode == 200) {
        final post = Post.fromJson(jsonDecode(response.body));
        state = state.copyWith(
          posts: [...state.posts, post],
        );
        _nextPostId++;
      } else {
        throw Exception('Failed to fetch post');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void editPost(int id, String title, String body) {
    state = state.copyWith(
      posts: state.posts.map((post) {
        if (post.id == id) {
          return Post(id: id, title: title, body: body);
        } else {
          return post;
        }
      }).toList(),
    );
  }

  void deletePost(int id) {
    state = state.copyWith(
      posts: state.posts.where((post) => post.id != id).toList(),
    );
  }
}

// Edit Post Page
class EditPostPage extends ConsumerWidget {
  final Post post;

  const EditPostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postNotifier = ref.read(postProvider.notifier); // Access notifier

    final _titleController = TextEditingController(text: post.title);
    final _bodyController = TextEditingController(text: post.body);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                postNotifier.editPost(
                  post.id,
                  _titleController.text,
                  _bodyController.text,
                );
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Page
class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD using JASON API and Riverpod'),
      ),
      body: postState.error.isNotEmpty
          ? Center(child: Text('Error: ${postState.error}'))
          : postState.posts.isEmpty
              ? Center(
                  child: Text(
                  'Press the + button to fetch posts',
                  style: TextStyle(fontSize: 18),
                )) // Empty state message
              : ListView.separated(
                  // Use ListView.separated
                  itemCount: postState.posts.length,
                  itemBuilder: (context, index) {
                    final post = postState.posts[index];
                    return ListTile(
                      title: Text(
                        post.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(post.body),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditPostPage(post: post),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              ref
                                  .read(postProvider.notifier)
                                  .deletePost(post.id);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(), // Add dividers
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postProvider.notifier).fetchPost();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Main App
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post CRUD Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
