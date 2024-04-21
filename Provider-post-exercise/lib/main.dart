import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ItemList(),
        child: HomeScreen(),
      ),
    );
  }
}

class Item {
  final int id;
  final String title;
  final String body;

  Item({required this.id, required this.title, required this.body});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class ItemList with ChangeNotifier {
  List<Item> _items = [];
  List<Item> get items => _items;

  int _nextIdToFetch = 1; // Start fetching from ID 1

  Future<void> fetchNextItem() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$_nextIdToFetch'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final newItem = Item.fromJson(jsonData);
      _items.add(newItem);
      _nextIdToFetch++; // Increment for the next fetch
      notifyListeners();
    } else {
      throw Exception('Failed to fetch item');
    }
  }

  Future<void> _addItem(String title, String body) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: json.encode({'title': title, 'body': body}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final newItem = Item.fromJson(jsonData);
      _items.add(newItem);
      notifyListeners();
    } else {
      throw Exception('Failed to add item');
    }
  }

  Future<void> editItem(int id, String newTitle, String newBody) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      body: json.encode({'title': newTitle, 'body': newBody}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final updatedItemIndex = _items.indexWhere((item) => item.id == id);
      if (updatedItemIndex != -1) {
        _items[updatedItemIndex] = Item(
          id: id,
          title: newTitle,
          body: newBody,
        );
        notifyListeners();
      }
    } else {
      throw Exception('Failed to update item');
    }
  }

  Future<void> deleteItem(int id) async {
    final response = await http
        .delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    if (response.statusCode == 200) {
      _items.removeWhere(
          (item) => item.id == id); // Remove the item with the corresponding ID
      notifyListeners();
    } else {
      throw Exception('Failed to delete item');
    }
  }

  Future<void> addItemFromApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final title = jsonData['title'];
      final body = jsonData['body'];
      await _addItem(title, body); // Call _addItem with title and body from API
    } else {
      throw Exception('Failed to fetch item from API');
    }
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<ItemList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD using JASON API and Provider'),
      ),
      body: itemList.items.isEmpty
          ? Center(
              child: Text(
                'Press the + button to add data',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: itemList.items.length,
              itemBuilder: (context, index) {
                final item = itemList.items[index];
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        item.body,
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  TextEditingController titleController =
                                      TextEditingController(text: item.title);
                                  TextEditingController bodyController =
                                      TextEditingController(text: item.body);

                                  return AlertDialog(
                                    title: Text('Edit Item'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        TextField(
                                          controller: titleController,
                                          decoration: InputDecoration(
                                              labelText: 'Title'),
                                        ),
                                        TextField(
                                          controller: bodyController,
                                          decoration: InputDecoration(
                                              labelText: 'Body'),
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          itemList.editItem(
                                            item.id,
                                            titleController.text,
                                            bodyController.text,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Delete Item'),
                                    content: Text(
                                        'Are you sure you want to delete this item?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          itemList.deleteItem(item
                                              .id); // Pass the ID of the current item
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(), // Add a divider line
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          itemList.fetchNextItem(); // Fetch one item at a time
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
