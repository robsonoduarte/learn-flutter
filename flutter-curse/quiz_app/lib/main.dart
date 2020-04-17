import 'package:flutter/material.dart';
import 'package:flutter_basic/answer.dart';
import 'package:flutter_basic/question.dart';
import 'package:flutter_basic/quiz.dart';
import 'package:flutter_basic/result.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var quizSelected = 0;
  var totalScore = 0;
  List<Quiz> _quizzes;

  _QuestionAppState() {
    _quizzes = [
      Quiz(Question("How is your favorite color ?"), [
        Answer("Balck", 5, _answer),
        Answer("Red", 10, _answer),
        Answer("Green", 7,_answer),
        Answer("'White'",4, _answer),
      ]),
      Quiz(Question("How is your favorite Aninal ?"), [
        Answer("Dog", 10, _answer),
        Answer("Cat", 8, _answer),
        Answer("Duck", 6, _answer),
        Answer("Elefant",0 , _answer),
      ]),
      Quiz(Question("How is your favorite Theacher ?"), [
        Answer("Leo", 10,  _answer),
        Answer("Robson", 8,  _answer),
        Answer("Ana Mara", 0,_answer),
        Answer("Aparecida", 7, _answer),
      ])
    ];
  }

  void _answer(int score) {
    setState(() {
      quizSelected++;
      totalScore += score;
    });
  }

  void _restartQuiz(){
    setState(() {
      quizSelected = 0;
      totalScore = 0;
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
                : Result('Your Total Score is $totalScore', _restartQuiz)));
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
