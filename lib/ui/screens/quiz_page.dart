// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizzler/providers/correct_answer_provider.dart';
import 'package:quizzler/providers/question_provider.dart';
import 'package:quizzler/providers/score_provider.dart';
import 'package:quizzler/ui/widgets/base_body.dart';
import 'package:quizzler/ui/widgets/quiz_button.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> questions =
        context.watch<QuestionProvider>().displayedQuestions;
    int selected = context.watch<QuestionProvider>().selected;

    int qLength = context.read<QuestionProvider>().displayedQuestions.length;

    void scoreAnswer(bool answer) {
      if (questions[selected][1] == answer) {
        context.read<ScoreProvider>().correct(
            selected); // rendering green checkmark if answer is correct
        context
            .read<CorrectAnswerProvider>()
            .correctAnswer(); // Sroting true if answer is correct
      } else {
        context.read<ScoreProvider>().incorrect(
            selected); // rendering red checkmerk if answer is incorrect
        context
            .read<CorrectAnswerProvider>()
            .incorrectAnswer(); // storing false if answer is incorrect
      }

      if (selected < qLength - 1) {
        context.read<QuestionProvider>().nextQuestion();
      } else {
        Navigator.pushNamed(context, '/score');
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: BaseBody(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "${questions[selected][0]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    QuizButton(
                      title: "True",
                      pressedHandler: () => scoreAnswer(true),
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    QuizButton(
                      title: "False",
                      pressedHandler: () => scoreAnswer(false),
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: context.watch<ScoreProvider>().scoreKeeper,
                    )
                  ]),
            ),
          ),
        ],
      )),
    );
  }
}
