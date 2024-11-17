import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Label("Method 1: Loop in Array", bold: true),
            ...[
              for (var color in colors)
                Text(color, style: const TextStyle(fontSize: 18)),
            ],
            const SizedBox(height: 16), // Add some spacing
            
            Label("Method 2: Map", bold: true),
            ...colors.map((color) =>
                Text(color, style: const TextStyle(fontSize: 18))).toList(),
            const SizedBox(height: 16), // Add some spacing

            Label("Method 3: Dedicated Function", bold: true),
            ...getColorWidgets(),
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}

// Method 3: Using a dedicated function
List<Widget> getColorWidgets() {
  return colors.map((color) =>
      Text(color, style: const TextStyle(fontSize: 18))).toList();
}
