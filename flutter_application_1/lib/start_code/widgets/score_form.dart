import 'package:flutter/material.dart';
import '../models/course.dart';
import '../models/student_score.dart';

class ScoreForm extends StatefulWidget {
  final Course course;
  final Function(Course, StudentScore) onScoreAdded;
  ScoreForm({required this.course, required this.onScoreAdded});
  @override
  _ScoreFormState createState() => _ScoreFormState();
}

class _ScoreFormState extends State<ScoreForm> {
  final _formKey = GlobalKey<FormState>();
  String? _studentName;
  double? _scoreValue;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newScore = StudentScore(studentName: _studentName!, value: _scoreValue!);
      widget.onScoreAdded(widget.course, newScore);
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Score')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Student Name'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a name' : null,
              onSaved: (value) => _studentName = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Score Value'),
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a score' : null,
              onSaved: (value) => _scoreValue = double.tryParse(value!),
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
