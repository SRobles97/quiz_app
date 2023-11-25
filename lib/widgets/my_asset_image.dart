import 'package:flutter/material.dart';

class MyAssetImage extends StatelessWidget {
  final String name;
  final double width;
  final String title;
  final Color color;

  const MyAssetImage(
      {Key? key,
      required this.name,
      this.width = 200,
      required this.title,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/$name',
            width: width,
            color: color,
          ),
          const SizedBox(height: 60),
          Text(title,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }
}
