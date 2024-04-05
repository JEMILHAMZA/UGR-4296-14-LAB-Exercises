import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Adding some gap
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      // Implement back button action here
                    },
                  ),
                  Text(
                    'Order Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Adding some gap
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.green),
                          SizedBox(width: 8),
                          Text('Completed'),
                          Spacer(),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Order ID:'),
                          SizedBox(width: 8),
                          Spacer(),
                          Text('Sample ID:'),
                          SizedBox(width: 8),
                          Text('789012'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Order Date:'),
                          Spacer(),
                          Text('Sample Date: 2024-04-05'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Adding some gap
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Purchased Item'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/tshirt_image.jpg',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Blue T-shirt'),
                              Text('Size: L'),
                              Text('Price: \$200.0'),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Color: Blue'),
                              Text('Qty: 1'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/another_tshirt_image.jpg',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Red T-shirt'),
                              Text('Size: M'),
                              Text('Price: \$150.0'),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Color: Red'),
                              Text('Qty: 1'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

