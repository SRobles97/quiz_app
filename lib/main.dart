import 'package:flutter/material.dart';

import 'package:quiz_app/views/quiz.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
