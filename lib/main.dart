import 'package:flutter/material.dart';
import 'package:quizzler/providers/correct_answer_provider.dart';
import 'package:quizzler/providers/question_provider.dart';
import 'package:quizzler/providers/score_provider.dart';
import 'package:quizzler/ui/screens/answer_page.dart';
import 'package:quizzler/ui/screens/home_page.dart';
import 'package:quizzler/ui/screens/quiz_page.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/ui/screens/score_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScoreProvider()),
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (context) => CorrectAnswerProvider()),
      ],
      child: const Quizzler(),
    ),
  );
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/quiz': (context) => QuizPage(),
        '/score': (context) => ScorePage(),
        '/answer': (context) => AnswerPage(),
      },
    );
  }
}
