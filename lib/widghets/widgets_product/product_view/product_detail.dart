import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final String url;
  final String price;
  final String des;

  ProductDetailPage({
    required this.name,
    required this.url,
    required this.price,
    required this.des,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              url,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              price,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Description:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              des,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}