import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Center(
      child: Container(
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.blue[300], 
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.blue[600], 
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              ' This is the CADT students',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  ));
}
