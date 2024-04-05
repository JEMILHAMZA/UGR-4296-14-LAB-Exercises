import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrderDetailsPage(),
    );
  }
}

class OrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderStatusCard(),
            SizedBox(height: 16.0),
            OrderInfoCard(),
            SizedBox(height: 16.0),
            PurchasedItemsCard(),
            SizedBox(height: 16.0),
            ShippingInfoCard(),
            SizedBox(height: 16.0),
            PaymentInfoCard(),
          ],
        ),
      ),
    );
  }
}

class OrderStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 40.0),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Completed',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                Text('Order Completed 24 July 2024'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderInfoRow(label: 'Order ID', value: '#524120'),
            Divider(),
            OrderInfoRow(label: 'Order date', value: '20 July 2024, 05:00 PM'),
          ],
        ),
      ),
    );
  }
}

class OrderInfoRow extends StatelessWidget {
  final String label;
  final String value;

  OrderInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}

class PurchasedItemsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Purchased Items',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            PurchasedItem(
              imageUrl: 'assets/t-shirt.jpg',
              title: 'Blue t-shirt',
              size: 'L',
              color: 'Yellow',
              price: '\$50.00',
              quantity: '1',
            ),
            SizedBox(height: 8.0),
            PurchasedItem(
              imageUrl: 'assets/hoodie.jpg',
              title: 'Hoodie Rose',
              size: 'L',
              color: 'Yellow',
              price: '\$50.00',
              quantity: '1',
            ),
          ],
        ),
      ),
    );
  }
}

class PurchasedItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String size;
  final String color;
  final String price;
  final String quantity;

  PurchasedItem({
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.color,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(imageUrl, width: 50, height: 50),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Size: $size   Color: $color'),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Qty: $quantity'),
          ],
        ),
      ],
    );
  }
}

class ShippingInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ShippingInfoRow(label: 'Name', value: 'Jacob Jones'),
            SizedBox(height: 8.0),
            ShippingInfoRow(label: 'Phone Number', value: '(105) 555-3652'),
            SizedBox(height: 8.0),
            ShippingInfoRow(
                label: 'Address', value: '61480 Sunbrook Park, PC 5679'),
            SizedBox(height: 8.0),
            ShippingInfoRow(label: 'Shipment', value: 'Economy'),
          ],
        ),
      ),
    );
  }
}

class ShippingInfoRow extends StatelessWidget {
  final String label;
  final String value;

  ShippingInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Flexible(child: Text(value, textAlign: TextAlign.right)),
      ],
    );
  }
}

class PaymentInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            PaymentInfoRow(label: 'Payment Method', value: 'Cash On Delivery'),
          ],
        ),
      ),
    );
  }
}

class PaymentInfoRow extends StatelessWidget {
  final String label;
  final String value;

  PaymentInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}
