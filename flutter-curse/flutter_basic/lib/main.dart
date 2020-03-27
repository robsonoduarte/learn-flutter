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
        'text': 'How is your favorite color ?',
        'awsers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'text': 'How is your favorite color ?',
        'awsers': ['Dog', 'Cat', 'Duck', 'Elefant']
      },
      {
        'text': 'How is your favorite Theacher ?',
        'awsers': ['Robson', 'Ana Mara', 'Cida', 'Antonio']
      }
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: Column(
        children: [
          Question(questionsAndAnswers[_questionSelected]['text']),
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
