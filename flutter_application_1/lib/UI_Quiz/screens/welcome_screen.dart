import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

// This is a function that take time to give the ui to the user interface
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Quizz',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              text: 'Start Quiz',
              onPressed: () {
                Navigator.pushNamed(context, '/questions');
              },
            ),
          ],
        ),
      ),
    );
  }
}
