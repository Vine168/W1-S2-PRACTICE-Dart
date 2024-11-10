import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favorite Cards'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Card(isFavorite: false),
            Card(isFavorite: false),
          ],
        ),
      ),
    );
  }
}
class Card extends StatefulWidget {
  final bool isFavorite;

 Card({required this.isFavorite});

  @override
  _CardState createState() => _CardState();
}
class _CardState extends State<Card> {
  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IPhone',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 16),
                ),
                Text(
                  'price 1600',
                  style: TextStyle(
                    color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
    );
  }
}
