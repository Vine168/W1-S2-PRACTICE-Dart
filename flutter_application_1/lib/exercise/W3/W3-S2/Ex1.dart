import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello, my name is Vine',
            style: TextStyle(
              fontSize: 45,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}
