import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.questionIndex,
      required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        //This is a pretty good shortcut to generate a list of widgets in children property
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((e) => Answer(
                answerText: e['text'] as String,
                selectHandler: () => answerQuestion(e['score'])))
            .toList(),
      ],
    );
  }
}
