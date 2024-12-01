import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final TextEditingController _dollarController = TextEditingController();
  double _convertedValue = 0.0;
  String _selectedDevice = "Euro";

  final Map<String, double> _conversionRates = {
    "Euro": 0.95,
    "Riels": 4100.0,
    "Dong": 25346.0,
  };

  void _onConvert() {
    final String input = _dollarController.text;

    if (input.isNotEmpty) {
      final double dollarValue = double.tryParse(input) ?? 0.0;
      setState(() {
        _convertedValue = dollarValue * _conversionRates[_selectedDevice]!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          'Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.orange,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.device_hub,
                    color: Colors.white,
                    size: 80,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Converter',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Amount in dollars:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _dollarController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                prefixText: '\$ ',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Device:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: _selectedDevice,
              dropdownColor: Colors.white,
              isExpanded: true,
              items: _conversionRates.keys
                  .map(
                    (device) => DropdownMenuItem(
                      value: device,
                      child: Text(
                        device.toUpperCase(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDevice = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Amount in selected device:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                hintText: _convertedValue.toStringAsFixed(2),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 32,
                  ),
                ),
                onPressed: _onConvert,
                child: const Text(
                  'Convert',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
