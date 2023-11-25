import 'package:flutter/material.dart';

class DecoratedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double fontSize;
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final bool hasIcon;

  const DecoratedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.deepPurple,
    this.textColor = Colors.white,
    this.fontSize = 20,
    this.width = 200,
    this.height = 45,
    this.borderRadius = 25,
    this.borderWidth = 1.5,
    this.borderColor = Colors.white,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: hasIcon ? _buildButtonWithIcon() : _buildButton()
    );
  }

  Widget _buildButtonWithIcon() {
    return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(color: borderColor, width: borderWidth),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(borderRadius))),
        ),
        onPressed: onPressed,
        icon: const Icon(Icons.play_arrow, color: Colors.white),
        label: Text(text,
            style: TextStyle(fontSize: fontSize, color: textColor)));
  }

  Widget _buildButton() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(color: borderColor, width: borderWidth),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(borderRadius))),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(fontSize: fontSize, color: textColor)));
  }

}
