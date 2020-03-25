import 'package:flutter/material.dart';

main() => runApp(QuestionApp());

class QuestionAppState extends State<QuestionApp>{
  var questionSelected = 0;
  void answer(){
    setState(() {
      questionSelected++;
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
          ),body: Column(
          children: [
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



class QuestionApp extends StatefulWidget{
  @override
  QuestionAppState createState() {
    return QuestionAppState();
  }
}