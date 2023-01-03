// ignore: file_names
// ignore: file_names

import 'package:ouizapp/utils/Question.dart';

class Quiz {
  final List<Question> _question;
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._question) {
    _question.shuffle();
  }
  List<Question> get question => _question;
  int get lenght => _question.length;
  int get questionNumber => _currentQuestionIndex + 1;
  int get score => _score;

  Question? get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= lenght) return null;
    return _question[_currentQuestionIndex];
  }

  void answer(bool iscorrect) {
    if (iscorrect) _score++;
  }
}