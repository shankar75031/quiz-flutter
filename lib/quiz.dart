import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> answers;
  final Function answerQuestion;

  Quiz(
      {@required this.questionText,
      @required this.answers,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionText),
        ...(answers.map((answer) {
          return Answer(answer['text'], () => answerQuestion(answer['score']));
        }))
      ],
    );
  }
}
