import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});
  @override
  State<Temperature> createState() => _TemperatureState();
}
class _TemperatureState extends State<Temperature> {
  final TextEditingController _inputController = TextEditingController();
  String _convertedValue = '';
  void _convertToFahrenheit() {
    if (_inputController.text.isEmpty) {
      setState(() {
        _convertedValue = 'Please enter a value!';
      });
      return;
    }
    try {
      double celsius = double.parse(_inputController.text);
      double fahrenheit = (celsius * 9 / 5) + 32;
      setState(() {
        _convertedValue = '${fahrenheit.toStringAsFixed(2)} °F';
      });
    } catch (e) {
      setState(() {
        _convertedValue = 'Invalid input!';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Temperature in Degrees (Celsius):",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Enter a temperature',
                hintStyle: const TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _convertToFahrenheit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Convert to Fahrenheit",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Temperature in Fahrenheit:",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _convertedValue.isEmpty ? 'Result will appear here' : _convertedValue,
                style: const TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
