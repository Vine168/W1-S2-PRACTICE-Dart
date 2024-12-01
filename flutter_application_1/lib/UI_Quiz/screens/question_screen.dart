import 'package:flutter/material.dart';
import '../widgets/quiz_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}
class _QuestionScreenState extends State<QuestionScreen> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the short form of the word Cambodia Academy of Digital Technology?',
      'answers': ['CIDD', 'CATT', 'CADT', 'CATD'],
      'correctAnswer': 'CADT',
    },
    {
      'question': 'What is the official language spoken in Cambodia?',
      'answers': ['Thai', 'Khmer', 'Vietnamese', 'Chinese'],
      'correctAnswer': 'Khmer',
    },
    {
      'question': 'When did Cambodia gain independence from French colonial rule?',
      'answers': ['1948', '1953', '1960', '1975'],
      'correctAnswer': '1953',
    },
    
  ];
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _submissions = [];
  void _selectAnswer(String answer) {
    final correctAnswer = _questions[_currentIndex]['correctAnswer'] as String;
    final isCorrect = answer == correctAnswer;

    _submissions.add({
      'question': _questions[_currentIndex]['question'] as String,
      'selectedAnswer': answer,
      'isCorrect': isCorrect,
    });
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pushNamed(context, '/results', arguments: _submissions);
    }
  }
  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentIndex]['question'] as String;
    final answers = _questions[_currentIndex]['answers'] as List<String>;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 30),
            ...answers.map((answer) {
              return QuizButton(
                text: answer,
                onPressed: () => _selectAnswer(answer),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
