import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s the color of bananas?',
      'answers': [
        {'text': 'Black', 'score': 0},
        {'text': 'Red', 'score': 0},
        {'text': 'Yellow', 'score': 1},
        {'text': 'White', 'score': 0},
      ]
    },
    {
      'questionText': 'Where does the lion lives?',
      'answers': [
        {'text': 'City', 'score': 0},
        {'text': 'Village', 'score': 0},
        {'text': 'Jungle', 'score': 1},
        {'text': 'Desert', 'score': 0},
      ]
    },
    {
      'questionText': 'In which continent is Madagascar?',
      'answers': [
        {'text': 'Africa', 'score': 1},
        {'text': 'Asia', 'score': 0},
        {'text': 'South America', 'score': 0},
        {'text': 'Europe', 'score': 0},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
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
          backgroundColor: Colors.orangeAccent,
          title: const Center(
            child: Text('Quiz application'),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz, _questions.length),
      ),
    );
  }
}
