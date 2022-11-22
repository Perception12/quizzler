// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class ScoreProvider with ChangeNotifier {
  int _score = 0;
  List<Widget> _scoreKeeper = [
    ...List.generate(
      10,
      (index) => Icon(
        Icons.circle_outlined,
        color: Colors.grey,
        size: 16,
      ),
    ).toList()
  ];

  // getters
  int get score => _score;
  List<Widget> get scoreKeeper => _scoreKeeper;

  void correct(selected) {
    _score++;
    _scoreKeeper[selected] = Icon(
      Icons.check,
      color: Colors.green,
    );
    notifyListeners();
  }

  void incorrect(selected) {
    _scoreKeeper[selected] = Icon(
      Icons.close,
      color: Colors.redAccent,
    );
    notifyListeners();
  }

  void resetScores() {
    _score = 0;
    _scoreKeeper = [
      ...List.generate(
        10,
        (index) => Icon(
          Icons.circle_outlined,
          color: Colors.grey,
          size: 16,
        ),
      ).toList()
    ];
    notifyListeners();
  }
}
