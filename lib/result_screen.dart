import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

import 'question_summary.dart';

class ResultScreen extends StatelessWidget {
  final void Function() onRestartQuiz;
  final List<String> selectedAnswers;
  int correctAnswerCount = 0;

  ResultScreen({
    super.key,
    required this.onRestartQuiz,
    required this.selectedAnswers,
  }) {
    for (var index = 0; index < questions.length; index++) {
      var question = questions.elementAt(index);
      String? answer = index < selectedAnswers.length
          ? selectedAnswers.elementAt(index)
          : null;
      if (answer == question.answers.elementAt(0)) {
        correctAnswerCount++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswerCount out of ${questions.length} questions correctly!',
              style: TextStyle(
                color: Color.fromARGB(255, 225, 190, 255),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummary(selectedAnswers: selectedAnswers),
            SizedBox(height: 20),
            TextButton.icon(
              onPressed: onRestartQuiz,
              icon: Icon(Icons.refresh),
              label: Text('Restart Quiz!'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
