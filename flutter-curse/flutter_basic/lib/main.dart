import 'package:flutter/material.dart';

main() => runApp(QuestionApp());

class QuestionApp extends StatelessWidget{


  var questionSelected = 0;

  void answer(){
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
        ),body: Column(
          children: <Widget>[
            Text(questions[questionSelected]),
            RaisedButton(
              child: Text('Anwser 1'),
              onPressed: answer,
            ),
            RaisedButton(
              child: Text('Anwser 2'),
              onPressed: answer,
            ),
            RaisedButton(
              child: Text('Anwser 3'),
              onPressed: answer,
            ),
          ],
        ),
      )
    );
  }
}