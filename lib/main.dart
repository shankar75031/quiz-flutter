import "package:flutter/material.dart";
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _question = const [
    {
      'questionText': "what is your fav color?",
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 6,
        },
        {
          'text': 'Green',
          'score': 4,
        },
      ]
    },
    {
      'questionText': "who is your favourite actor/actress",
      'answers': [
        {
          'text': 'Parvathi',
          'score': 10,
        },
        {
          'text': 'Suraj',
          'score': 8,
        },
        {
          'text': 'Fahad',
          'score': 6,
        },
        {
          'text': 'Nazriya',
          'score': 4,
        },
      ]
    },
    {
      'questionText': "chugaano",
      'answers': [
        {
          'text': 'aanu',
          'score': 10,
        },
        {
          'text': 'alla',
          'score': 5,
        },
        {
          'text': 'arinjuda',
          'score': 0,
        },
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _question.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    } else {}
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quizzo"),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                questionText: _question[_questionIndex]['questionText'],
                answers: _question[_questionIndex]['answers']
                    as List<Map<String, Object>>,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
