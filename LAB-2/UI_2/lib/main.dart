import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailsScreen(),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search product',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[100],
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.grey),
            onPressed: () {},
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
          SizedBox(width: 40),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Container with Product Image and Details
            Container(
              color: Color(0xFFE0F7FA), // Light Greenish Blue
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Brand Name on the Left
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Color(0xFF81C784), // Light Green
                        child: Text(
                          'BARDI',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // Lamp Image
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 200, // Set your desired width
                          height: 200, // Set your desired height
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset('assets/lamp.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Feature Icons and Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      featureIcon(Icons.credit_card, 'Multiple Scenario'),
                      featureIcon(Icons.swap_horiz, 'Switch'),
                      featureIcon(Icons.group, 'Multiple User'),
                      featureIcon(Icons.power, '12 Watt'),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Page Indicator on the Left
                  Align(
                    alignment: Alignment.bottomLeft, // Changed alignment
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF4DB6AC), // Blue-Green
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '1/5',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Product Name and Details
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$8.6',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.favorite, color: Colors.grey[700]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'BARDI Smart Light Bulb Lamp Bohlam LED WIFI RGBWW 12W 12 watt Home IoT',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text('5.0(354)   |'),
                      SizedBox(width: 20),
                      Text('540 Sale   |'),
                      SizedBox(width: 20),
                      Icon(Icons.location_on, color: Colors.grey),
                      Text('Brooklyn'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Product Variant Selection
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Variant',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Size : XS',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  // Size Selection
                  Row(
                    children: [
                      sizeOption('XS', true),
                      sizeOption('S'),
                      sizeOption('M'),
                      sizeOption('L'),
                      sizeOption('XL'),
                      sizeOption('XXL'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Color : Red',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  // Color Selection
                  Row(
                    children: [
                      colorOption('Red', true),
                      colorOption('Black'),
                      colorOption('Green'),
                      colorOption('White'),
                      colorOption('Blue'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Add to Cart Button
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF4DB6AC), // Blue-Green
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.comment, color: Colors.white),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints
                              .maxWidth, // Ensure the button takes the full width available
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: Colors.blue,
                                ), // Add blue border here
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Add to Shopping Cart',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create feature icons with text

  Widget featureIcon(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white, // White background for the circle
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.black, // Set a visible icon color
            size: 24,
          ),
        ),
        SizedBox(height: 5),
        Text(text),
      ],
    );
  }

  // Helper function to create size selection option
  Widget sizeOption(String size, [bool isSelected = false]) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF4DB6AC) : Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  // Helper function to create color selection option
  Widget colorOption(String color, [bool isSelected = false]) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF4DB6AC) : Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          color,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
