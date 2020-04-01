import 'package:flutter/material.dart';
import 'package:flutter_basic/answer.dart';
import 'package:flutter_basic/question.dart';

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
    List<String> answers = _hasQuestionSelected()
        ? _questionsAndAnswers[_questionSelected]['answers']
        : null;

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Questions'),
          ),
          body: _hasQuestionSelected()
              ? Column(children: [
                  Question(_questionsAndAnswers[_questionSelected]['question']),
                  ...answers.map((answer) => Answer(answer, _answer)).toList(),
                ])
              : Center(
            child: Text(
              'Congratulation',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
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
