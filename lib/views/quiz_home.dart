import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/decorated_button.dart';
import 'package:quiz_app/widgets/my_asset_image.dart';

class QuizHome extends StatelessWidget {
  final VoidCallback onPressed;

  const QuizHome({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const MyAssetImage(
          name: 'quiz-logo.png',
          title: 'Learn Flutter the fun way!',
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 30),
        DecoratedButton(
          text: 'Start Quiz',
          onPressed: onPressed,
          hasIcon: true,
        ),
      ],
    );
  }
}
