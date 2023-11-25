import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  final Question question;
  final Function(String) addAnswer;

  const QuestionsScreen({
    Key? key,
    required this.question,
    required this.addAnswer,
  }) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _handleAnswer(String answer) {
    widget.addAnswer(answer);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.question.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              )),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.question.answers.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: AnswerButton(
                  text: widget.question.answers[index],
                  onPressed: () {
                    _handleAnswer(widget.question.answers[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
