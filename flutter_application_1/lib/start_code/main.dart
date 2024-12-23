import 'package:flutter/material.dart';
import 'package:flutter_application_1/start_code/widgets/courses_view.dart';
import 'models/course.dart';
import 'models/student_score.dart';
// import 'start_code/widgets/courses_view.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final List<Course> courses = [
    Course(name: 'Maths', scores: [
      StudentScore(studentName: 'Vine', value: 85),
      StudentScore(studentName: 'Rith', value: 70),
    ]),
    Course(name: 'Physics', scores: [
      StudentScore(studentName: 'Piseth', value: 60),
      StudentScore(studentName: 'Bona', value: 40),
      StudentScore(studentName: 'Wathana', value: 21),
    ]),
    Course(name: 'English', scores: [
      StudentScore(studentName: 'Boromey', value: 35),
      StudentScore(studentName: 'Chantra', value: 10),
    ]),
  ];
  void _addScore(Course course, StudentScore score) {
    setState(() {
      course.scores.add(score);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Score Manager',
      debugShowCheckedModeBanner: false,
      home: CoursesView(courses: courses, onScoreAdded: _addScore),
    );
  }
}
