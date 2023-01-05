import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  final int numOfQuestions;

  const Result(this.resultScore, this.resetQuiz, this.numOfQuestions,
      {super.key});

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent.';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are strange!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your score is $resultScore/$numOfQuestions',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: resetQuiz,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Text('Restart quiz!'),
          )
        ],
      ),
    );
  }
}
