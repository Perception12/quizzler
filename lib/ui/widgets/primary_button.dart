// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/question_provider.dart';

class PrimaryButton extends StatelessWidget {
  final Function handler;
  final String title;
  final Color? buttonColor;
  final Color? textColor;
  const PrimaryButton(
      {super.key,
      required this.title,
      required this.handler,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextButton(
        onPressed: () => handler(),
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(buttonColor ?? Colors.green)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
