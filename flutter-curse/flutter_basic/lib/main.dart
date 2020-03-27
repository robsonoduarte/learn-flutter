import 'package:flutter/material.dart';
import 'package:flutter_basic/answer.dart';
import 'package:flutter_basic/question.dart';

main() => runApp(QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _questionSelected = 0;

  void _answer() {
    setState(() {
      _questionSelected++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionsAndAnswers = [
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

    List<String> answers = questionsAndAnswers[_questionSelected]['answers'];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: Column(children: [
        Question(questionsAndAnswers[_questionSelected]['question']),
        ...answers.map((answer) => Answer(answer, _answer)).toList(),
      ]),
    ));
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
