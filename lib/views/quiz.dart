import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/views/questions_screen.dart';
import 'package:quiz_app/views/quiz_home.dart';
import 'package:quiz_app/views/summary_screen.dart';
import 'package:quiz_app/widgets/gradient_container.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Question> _quizQuestions = questions;
  final List<String> _correctAnswers = <String>[];
  final List<String> _userAnswers = <String>[];
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int _currentQuestion = 0;

  @override
  void initState() {
    super.initState();
    _correctAnswers.addAll(_quizQuestions.map((e) => e.answers[0]));
    for (var element in _quizQuestions) {
      element.shuffleAnswers();
    }
  }

  void _addAnswers(String answer) {
    _userAnswers.add(answer);
    _answerQuestion();
  }

  void _startQuiz() {
    setState(() {
      _currentIndex = 1;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  void _answerQuestion() {
    setState(() {
      _currentQuestion++;
      if (_currentQuestion < _quizQuestions.length) {
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      } else {
        _currentQuestion = 0;
        _endQuiz();
      }
    });
  }

  void _endQuiz() {
    setState(() {
      _currentIndex = 2;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _currentQuestion = 0;
      _userAnswers.clear();
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: GradientContainer(
            child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            QuizHome(
              onPressed: _startQuiz,
            ),
            QuestionsScreen(
              question: _quizQuestions[_currentQuestion],
              addAnswer: _addAnswers,
            ),
            SummaryScreen(
              correctAnswers: _correctAnswers,
              userAnswers: _userAnswers,
              onResetPressed: _resetQuiz,
            ),
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentQuestion = 0;
    _currentIndex = 0;
    super.dispose();
  }
}
