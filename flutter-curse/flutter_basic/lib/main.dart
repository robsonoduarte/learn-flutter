import 'package:flutter/material.dart';
import 'package:flutter_basic/answer.dart';
import 'package:flutter_basic/question.dart';
import 'package:flutter_basic/quiz.dart';
import 'package:flutter_basic/result.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _questionSelected = 0;
  final _questionsAndAnswers = const [
    {
      'question': 'How is your favorite color ?',
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'question': 'How is your favorite color ?',
      'answers': ['Dog', 'Cat', 'Duck', 'Elefant'],
    },
    {
      'question': 'How is your favorite Theacher ?',
      'answers': ['Robson', 'Ana Mara', 'Cida', 'Antonio'],
    }
  ];

  void _answer() {
    setState(() {
      _questionSelected++;
    });
  }

  _hasQuestionSelected() {
    return _questionSelected < _questionsAndAnswers.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: _hasQuestionSelected()
          ? Quiz(questionsAndAnswers: _questionsAndAnswers, questionSelected : _questionSelected, answer: _answer)
          : Result('Congratulations Bravox !'),
    ));
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
