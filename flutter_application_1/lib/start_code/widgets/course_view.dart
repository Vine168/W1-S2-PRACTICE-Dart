import 'package:flutter/material.dart';
import 'package:flutter_application_1/start_code/models/student_score.dart';
import '../models/course.dart';
import 'score_form.dart';

class CourseView extends StatelessWidget {
  final Course course;
  final Function(Course, StudentScore) onScoreAdded;
  CourseView({required this.course, required this.onScoreAdded});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: ListView.builder(
        itemCount: course.scores.length,
        itemBuilder: (context, index) {
          final score = course.scores[index];
          Color scoreColor;
          if (score.value > 50) {
            scoreColor = Colors.green;
          } else if (score.value >= 30) {
            scoreColor = Colors.orange;
          } else {
            scoreColor = Colors.red;
          }
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(score.studentName),
              trailing: Text(score.value.toString(), style: TextStyle(color: scoreColor)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScoreForm(course: course, onScoreAdded: onScoreAdded),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
