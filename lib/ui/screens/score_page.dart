// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizzler/providers/question_provider.dart';
import 'package:quizzler/providers/score_provider.dart';
import 'package:quizzler/ui/widgets/base_body.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/ui/widgets/primary_button.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    int qLength = context.read<QuestionProvider>().displayedQuestions.length;
    int score = context.read<ScoreProvider>().score;
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
                "Your Score:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$score",
                    style: TextStyle(
                        color: score >= qLength / 2 ? Colors.green : Colors.red,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    " / $qLength",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButton(
                title: "Home",
                handler: () {
                  context.read<QuestionProvider>().resetQuestions();
                  context.read<ScoreProvider>().resetScores();
                  Navigator.pushNamed(context, '/');
                },
              ),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                title: "View Answers",
                handler: () {
                  Navigator.pushNamed(context, '/answer');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
