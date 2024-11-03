import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: ProductList(),
  ));
}
enum Product {
  dart(
    "Dart",
    "The best object language",
    "assets/dart.png",
  ),
  flutter(
    "Flutter",
    "The best mobile UI library",
    "assets/flutter.png",
  ),
  firebase(
    "Firebase",
    "The best cloud database",
    "assets/firebase.png",
  );
  final String title;
  final String description;
  final String imagePath;
  const Product(this.title, this.description, this.imagePath);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.imagePath, height: 50),
              SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                product.description,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: Product.values.map((product) {
            return ProductCard(product: product);
          }).toList(),
        ),
      ),
    );
  }
}
