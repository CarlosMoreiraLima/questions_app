import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projeto_perguntas/answer.dart';
import 'package:projeto_perguntas/question.dart';

class QuestionForm extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final Function(String) answer;

  const QuestionForm({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.answer,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> options =
        hasSelectedQuestion ? questions[selectedQuestion].cast()['options'] : [];
    return Column(
      children: <Widget>[
        Question(text: questions[selectedQuestion]['text'].toString()),
        Container(
          height: 50,
        ),
        ...options
            .map((option) => Answer(
                answer: option,
                whenSelected: () {
                  answer(option['option'].toString());
                }))
            .toList(),
      ],
    );
  }
}
