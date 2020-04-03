import 'package:flutter/cupertino.dart';
import 'package:flutter_basic/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questionsAndAnswers;
  final int questionSelected;
  final void Function() answer;

  const Quiz({
    @required this.questionsAndAnswers,
    @required this.questionSelected,
    @required this.answer
  });

  hasQuestionSelected() {
    return questionSelected < questionsAndAnswers.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = hasQuestionSelected()
        ? questionsAndAnswers[questionSelected]['answers']
        : null;
    return Column(children: [
    Question(questionsAndAnswers[questionSelected]['question']),
    ...answers.map((asw) => Answer(asw, answer)).toList(),
    ]
    );
  }

}