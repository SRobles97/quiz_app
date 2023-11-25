import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final Color startColor;
  final Color endColor;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientContainer({
    Key? key,
    required this.child,
    this.startColor = Colors.deepPurple,
    this.endColor = Colors.deepPurpleAccent,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [startColor, endColor],
        ),
      ),
      child: child,
    );
  }
}
