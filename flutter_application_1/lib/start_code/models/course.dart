import 'package:flutter_application_1/start_code/models/student_score.dart';
class Course {
  final String name;
  final List<StudentScore> scores;
  Course({required this.name, required this.scores});
  int get numberOfScores => scores.length;

  double get averageScore {
    if (scores.isEmpty) return 0.0;
    double total = 0;
    for (var score in scores) {
      total += score.value;
    }
    return total / scores.length;
  }
}
