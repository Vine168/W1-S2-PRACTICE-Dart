import 'package:flutter/material.dart';
import 'package:flutter_application_1/start_code/models/student_score.dart';
import '../models/course.dart';
import 'course_view.dart';

class CoursesView extends StatelessWidget {
  final List<Course> courses;
  final Function(Course, StudentScore) onScoreAdded;

  CoursesView({required this.courses, required this.onScoreAdded});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(course.name),
              subtitle: Text('Scores: ${course.numberOfScores}, Avg: ${course.averageScore.toStringAsFixed(1)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseView(course: course, onScoreAdded: onScoreAdded),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
