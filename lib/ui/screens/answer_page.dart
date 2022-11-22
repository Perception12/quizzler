// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizzler/providers/correct_answer_provider.dart';
import 'package:quizzler/providers/question_provider.dart';
import 'package:quizzler/providers/score_provider.dart';
import 'package:quizzler/ui/widgets/base_body.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/ui/widgets/primary_button.dart';
import 'package:quizzler/ui/widgets/question_answer.dart';

class AnswerPage extends StatelessWidget {
  const AnswerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> questions =
        context.watch<QuestionProvider>().displayedQuestions;

    List<bool> isCorrect = context.watch<CorrectAnswerProvider>().isCorrect;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: BaseBody(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/score');
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Answers",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        QuestionAnswer(
                          question: questions[index],
                          correct: isCorrect[index],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
