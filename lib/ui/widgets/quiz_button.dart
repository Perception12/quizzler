// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuizButton extends StatelessWidget {
  final String title;
  final Function pressedHandler;
  final Color color;
  const QuizButton(
      {super.key,
      required this.title,
      required this.pressedHandler,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => pressedHandler(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(color),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
