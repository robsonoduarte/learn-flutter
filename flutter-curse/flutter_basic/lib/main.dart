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
    print('question answered');
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      'How is your favorite color ?',
      'How is your favorite pet ?',
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: Column(
        children: [
          Question(questions[_questionSelected]),
          Answer('Anwser 1', _answer),
          Answer('Anwser 2', _answer),
          Answer('Anwser 3', _answer),
        ],
      ),
    ));
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
