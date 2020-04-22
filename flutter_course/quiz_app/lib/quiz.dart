import 'package:flutter/cupertino.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final Question question;
  final List<Answer> answers;

  const Quiz(this.question, this.answers);

  @override
  Widget build(BuildContext context) {
    return Column(children: [question, ...answers]);
  }
}
