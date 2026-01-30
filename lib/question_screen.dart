import 'package:adv_basics/AnswerButton.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> answers = [];

  QuizQuestion? get currentQuizQuestion {
    return questions.length > answers.length
        ? questions.elementAt(answers.length)
        : null;
  }

  void onAnswer(String answer) {
    setState(() {
      answers = [...answers, answer];
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuizQuestion = this.currentQuizQuestion;
    if (currentQuizQuestion != null) {
      var answerButtons = currentQuizQuestion.getShuffledAnswers().map((e) {
        return AnswerButton(
          buttonText: e,
          onPressed: () {
            onAnswer(e);
          },
        );
      });

      return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuizQuestion.text,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...answerButtons,
            ],
          ),
        ),
      );
    } else {
      return Text("finished");
    }
  }
}
