import 'package:flutter/material.dart';

main() => runApp(QuestionApp());

class QuestionApp extends StatelessWidget{
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
        ),body: Column(
          children: <Widget>[
            Text(questions[0]),
            RaisedButton(
              child: Text('Anwser 1'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Anwser 1'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Anwser 1'),
              onPressed: null,
            ),
          ],
        ),
      )
    );
  }
}