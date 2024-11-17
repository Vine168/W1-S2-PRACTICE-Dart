import 'package:flutter/material.dart';
import 'screen/welcome.dart';
import 'screen/temperature.dart';

void main() {
  runApp(const TemperatureApp());
}
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});
  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}
class _TemperatureAppState extends State<TemperatureApp> {
  bool showTemperatureScreen = false;

  void switchScreen() {
    setState(() {
      showTemperatureScreen = !showTemperatureScreen;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: showTemperatureScreen
              ? Temperature() 
              : Welcome(onStart: switchScreen),
        ),
      ),
    );
  }
}
