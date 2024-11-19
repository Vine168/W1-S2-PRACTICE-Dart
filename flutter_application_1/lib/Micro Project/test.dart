// import 'dart:io';

// // Step 1: Define the Question Model
// class Question {
//   String questionText;
//   List<String> options;
//   int correctAnswerIndex;

//   Question({
//     required this.questionText,
//     required this.options,
//     required this.correctAnswerIndex,
//   });

//   bool checkAnswer(int selectedIndex) {
//     return selectedIndex == correctAnswerIndex;
//   }
// }

// // Step 2: Create a List of Questions
// List<Question> quizQuestions = [
//   Question(
//     questionText: "What is the capital of France?",
//     options: ["Berlin", "London", "Paris", "Rome"],
//     correctAnswerIndex: 2,
//   ),
//   Question(
//     questionText: "What is 2 + 2?",
//     options: ["3", "4", "5", "6"],
//     correctAnswerIndex: 1,
//   ),
//   Question(
//     questionText: "Which planet is known as the Red Planet?",
//     options: ["Earth", "Mars", "Jupiter", "Saturn"],
//     correctAnswerIndex: 1,
//   ),
//   Question(
//     questionText: "Who wrote 'To Kill a Mockingbird'?",
//     options: ["Harper Lee", "J.K. Rowling", "Ernest Hemingway", "Mark Twain"],
//     correctAnswerIndex: 0,
//   ),
// ];

// // Step 3: Display Questions and Handle User Input
// void startQuiz() {
//   int score = 0;

//   for (int i = 0; i < quizQuestions.length; i++) {
//     print("Q${i + 1}: ${quizQuestions[i].questionText}");
//     for (int j = 0; j < quizQuestions[i].options.length; j++) {
//       print("${j + 1}. ${quizQuestions[i].options[j]}");
//     }

//     // Get user's answer
//     stdout.write("Your answer (1-${quizQuestions[i].options.length}): ");
//     int userAnswer = int.parse(stdin.readLineSync()!) - 1;

//     if (quizQuestions[i].checkAnswer(userAnswer)) {
//       print("Correct!\n");
//       score++;
//     } else {
//       print("Wrong. The correct answer is: ${quizQuestions[i].options[quizQuestions[i].correctAnswerIndex]}\n");
//     }
//   }

//   print("Quiz completed! Your score is $score/${quizQuestions.length}.");
// }

// // Step 4: Run the Quiz
// void main() {
//   startQuiz();
// }


import 'dart:io';

// Define the Question class
class Question {
  final String text;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswerIndex,
  });

  // Check if the provided answer index is correct
  bool isCorrect(int answerIndex) {
    return answerIndex == correctAnswerIndex;
  }
}

// Define the Quiz class that contains a list of Question objects
class Quiz {
  final List<Question> questions;
  int score = 0;
  int currentQuestionIndex = 0;

  Quiz({required this.questions});

  // Display the current question and handle user input
  void displayCurrentQuestion() {
    final question = questions[currentQuestionIndex];
    print("Q${currentQuestionIndex + 1}: ${question.text}");

    for (var i = 0; i < question.options.length; i++) {
      print("${i + 1}. ${question.options[i]}");
    }

    stdout.write("Your answer (1-${question.options.length}): ");
    int userAnswer = int.parse(stdin.readLineSync()!) - 1;

    // Check if the answer is correct and update score
    if (question.isCorrect(userAnswer)) {
      print("Correct!\n");
      score++;
    } else {
      print("Wrong! The correct answer is: ${question.options[question.correctAnswerIndex]}\n");
    }
  }

  // Move to the next question, if available
  bool nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      return true;
    }
    return false;
  }

  // Run the quiz by displaying each question
  void start() {
    print("Welcome to the Quiz Game!\n");

    do {
      displayCurrentQuestion();
    } while (nextQuestion());

    print("Quiz completed! Your final score is: $score/${questions.length}");
  }
}

// Main function to initialize questions and start the quiz
void main() {
  // Initialize the quiz questions
  List<Question> quizQuestions = [
    Question(
      text: "What is the capital of France?",
      options: ["Berlin", "London", "Paris", "Rome"],
      correctAnswerIndex: 2,
    ),
    Question(
      text: "What is 2 + 2?",
      options: ["3", "4", "5", "6"],
      correctAnswerIndex: 1,
    ),
    Question(
      text: "Which planet is known as the Red Planet?",
      options: ["Earth", "Mars", "Jupiter", "Saturn"],
      correctAnswerIndex: 1,
    ),
    Question(
      text: "Who wrote 'To Kill a Mockingbird'?",
      options: ["Harper Lee", "J.K. Rowling", "Ernest Hemingway", "Mark Twain"],
      correctAnswerIndex: 0,
    ),
  ];

  // Create a Quiz instance with the questions
  Quiz quiz = Quiz(questions: quizQuestions);

  // Start the quiz
  quiz.start();
}
