import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[250],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(text: 'OOP', color: Colors.blue[100]!),
              SizedBox(height: 20),
              CustomCard(text: 'DART', color: Colors.blue[300]!),
              SizedBox(height: 20),
              CustomCard(text: 'FLUTTER', color: Colors.blue[600]!),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  
  CustomCard({required this.text, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
