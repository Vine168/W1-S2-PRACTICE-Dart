import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    );
  }
}
class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}
class _ImageGalleryState extends State<ImageGallery> {
  List<String> images = [
    'assets/dart.png',
    'assets/firebase.png',
    'assets/flutter.png',
  ];
  int currentIndex = 0;
  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }
  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _previousImage,
            tooltip: 'Go to the previous image',
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: _nextImage,
            tooltip: 'Go to the next image',
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[currentIndex]),
      ),
    );
  }
}
