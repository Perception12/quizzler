import 'package:flutter/cupertino.dart';

class CorrectAnswerProvider with ChangeNotifier {
  List<bool> _isCorrect = [];

  List<bool> get isCorrect => _isCorrect;

  void correctAnswer() {
    _isCorrect.add(true);
    notifyListeners();
  }

  void incorrectAnswer() {
    _isCorrect.add(false);
    notifyListeners();
  }

  void resetAnswers() {
    _isCorrect = [];
    notifyListeners();
  }
}
