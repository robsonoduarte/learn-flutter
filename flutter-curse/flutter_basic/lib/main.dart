import 'package:flutter/material.dart';
import 'package:flutter_basic/answer.dart';
import 'package:flutter_basic/question.dart';
import 'package:flutter_basic/quiz.dart';
import 'package:flutter_basic/result.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var quizSelected = 0;
  List<Quiz> _quizzes;

  _QuestionAppState() {
    _quizzes = [
      Quiz(Question("How is your favorite color ?"), [
        Answer("Balck", _answer),
        Answer("Red", _answer),
        Answer("Green", _answer),
        Answer("'White'", _answer),
      ]),
      Quiz(Question("How is your favorite Aninal ?"), [
        Answer("Dog", _answer),
        Answer("Cat", _answer),
        Answer("Duck", _answer),
        Answer("Elefant", _answer),
      ]),
      Quiz(Question("How is your favorite Theacher ?"), [
        Answer("Leo", _answer),
        Answer("Robson", _answer),
        Answer("Ana Mara", _answer),
        Answer("Aparecida", _answer),
      ])
    ];
  }

  void _answer() {
    setState(() {
      quizSelected++;
    });
  }

  _hasQuizSelected() {
    return quizSelected < _quizzes.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Quiz'),
            ),
            body: _hasQuizSelected()
                ? _quizzes.elementAt(quizSelected)
                : Result('Congratulations Bravox !')));
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
