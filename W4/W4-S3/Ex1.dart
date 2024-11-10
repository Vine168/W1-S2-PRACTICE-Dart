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
        body: Center(
          child: const SelectableButton(),
          ),
        ),
      );
  }
}
class SelectableButton extends StatefulWidget {
  const SelectableButton({Key? key}) : super(key: key);

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}
class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  String get buttonText => isSelected ? "Selected" : "Not selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: textColor), 
        ),
      ),
    );
  }
}
