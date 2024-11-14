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
              Container(
                width: 230,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'OOP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 230,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'DART',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 230,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'FLUTTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
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
