import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget{

  final String result;

  const Result(this.result);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center  (
      child: Text(
         result,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
    )
    );
  }
}
