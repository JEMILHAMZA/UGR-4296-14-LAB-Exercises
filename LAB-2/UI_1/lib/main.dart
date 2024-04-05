
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IJ Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.help_outline, color: Colors.white),
                  ),
                  const Text(
                    'IJ Tracker',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/coffe.jpg'),
                        radius: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'John Doe', // Example user name
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Online',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                padding: const EdgeInsets.all(8),
                children: [
                  _buildGridItem(Icons.map, 'Map'),
                  _buildGridItem(Icons.location_on, 'Location'),
                  _buildGridItem(Icons.history, 'History'),
                  _buildGridItem(Icons.person, 'Person'),
                  _buildGridItem(Icons.home, 'Home'),
                  _buildGridItem(Icons.phone, 'Phone'),
                  _buildGridItem(Icons.email, 'Email'),
                  _buildGridItem(Icons.payment, 'Payment'),
                  _buildGridItem(Icons.shopping_cart, 'Shopping'),
                  _buildGridItem(Icons.favorite, 'Favorite'),
                  _buildGridItem(Icons.camera_alt, 'Camera'),
                  _buildGridItem(Icons.music_note, 'Music'),
                  _buildGridItem(Icons.movie, 'Movie'),
                  _buildGridItem(Icons.book, 'Book'),
                  _buildGridItem(Icons.school, 'School'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String text) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),
          SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
