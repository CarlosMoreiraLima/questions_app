import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questions.dart';
import 'package:projeto_perguntas/result.dart';
import 'package:projeto_perguntas/form.dart';

void main() {
  runApp(QuestionApp());
}

class _QuestionAppState extends State<QuestionApp> {
  var _score = 0;
  var _selectedQuenstion = 0;

  String get response {
    return questions[_selectedQuenstion].cast()['answer'];
  }

  bool get hasSelectedQuestion {
    return _selectedQuenstion < questions.length;
  }

  int score(String asw, String answer) {
    return asw == answer ? 1 : 0;
  }

  void restartApplication() {
    setState(() {
      _selectedQuenstion = 0;
      _score = 0;
    });
  }

  void answer(String asw) {
    if (hasSelectedQuestion) {
      setState(() {
        _score += score(asw, response);
        _selectedQuenstion += 1;
      });
    }
    print('Pergunta $_selectedQuenstion respondida, pontos: $_score');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(colorScheme: ColorScheme.dark()),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Perguntas')),
        ),
        body: hasSelectedQuestion
            ? QuestionForm(
                questions: questions,
                selectedQuestion: _selectedQuenstion,
                answer: answer,
              )
            : Result(
                score: _score,
                maxScore: questions.length,
                restartApplication: restartApplication,
              ),
      ),
    );
  }
}

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}
