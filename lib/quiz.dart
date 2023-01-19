import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerquestion;
  final int index;

  Quiz({
    required this.questions,
    required this.answerquestion,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[index]['questionText'] as String),
        ...(questions[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerquestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
