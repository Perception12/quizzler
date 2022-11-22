// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizzler/providers/question_provider.dart';
import 'package:quizzler/ui/widgets/base_body.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/ui/widgets/primary_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void quizHandler() {
      context.read<QuestionProvider>().getQuestions();
      Navigator.pushNamed(context, '/quiz');
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: BaseBody(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Quizzler",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                handler: quizHandler,
                title: "Start Quiz",
              )
            ],
          ),
        ),
      ),
    );
  }
}
