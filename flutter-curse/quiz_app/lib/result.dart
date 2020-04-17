import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget{

  final String result;
  final Function() restartQuiz;

  const Result(this.result, this.restartQuiz);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center  (
          child: Text(
             result,
            style: TextStyle(
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
        )
        ),
        FlatButton(
          textColor: Colors.blue,
          onPressed: restartQuiz,
          child: Text(
            "Restart Quiz",
            style: new TextStyle(
              fontSize: 18
            ),
          ),
        ),
      ],
    );
  }
}
