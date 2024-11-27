import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> submissions =
        ModalRoute.of(context)!.settings.arguments as List<Map<String, dynamic>>;
    int score = submissions.where((submission) => submission['isCorrect'] == true).length;

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}