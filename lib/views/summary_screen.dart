import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/decorated_button.dart';

class SummaryScreen extends StatefulWidget {
  final List<String> correctAnswers;
  final List<String> userAnswers;
  final Function() onResetPressed;

  const SummaryScreen({
    Key? key,
    required this.correctAnswers,
    required this.userAnswers,
    required this.onResetPressed,
  }) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  int score = 0;

  @override
  void initState() {
    super.initState();
    score = _calculateScore();
  }

  int _calculateScore() {
    int score = 0;
    for (int i = 0; i < widget.correctAnswers.length; i++) {
      if (widget.correctAnswers[i] == widget.userAnswers[i]) {
        score++;
      }
    }
    return score;
  }

  void _showDetails(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Results',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              )),
          content: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3,
            child: PageView.builder(
              itemCount: widget.correctAnswers.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Icon(
                      widget.correctAnswers[index] == widget.userAnswers[index]
                          ? Icons.check_circle
                          : Icons.cancel,
                      color: widget.correctAnswers[index] ==
                              widget.userAnswers[index]
                          ? Colors.green
                          : Colors.red,
                      size: 24,
                    ),
                    Text(
                      'Your answer:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(widget.userAnswers[index]),
                    Text(
                      'Correct answer:',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(widget.correctAnswers[index]),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Text(
                      'Your answer is ${widget.correctAnswers[index] == widget.userAnswers[index] ? 'correct' : 'incorrect'}',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        index == widget.correctAnswers.length - 1
                            ? 'Swipe left to see previous answers \nor press Close to exit'
                            : 'Swipe right to see next answer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close', style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Score',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            '$score / ${widget.correctAnswers.length}',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              _showDetails(context);
            },
            child: Text(
              'Show Details',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          DecoratedButton(text: 'Reset Quiz', onPressed: widget.onResetPressed)
        ],
      ),
    );
  }
}
