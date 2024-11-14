void main() {
  // list of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];
  var passScores = scores.where((number) => number >= 50).toList();

  print('${passScores.length} students passed : $passScores');
}