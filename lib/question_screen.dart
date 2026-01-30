import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class QuestionScreen extends StatefulWidget {
  final void Function(String) onAnswer;

  const QuestionScreen({super.key, required this.onAnswer});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuizQuestionIndex = 0;

  QuizQuestion? get currentQuizQuestion {
    return questions.length > currentQuizQuestionIndex
        ? questions.elementAt(currentQuizQuestionIndex)
        : null;
  }

  void onAnswer(String answer) {
    widget.onAnswer(answer);
    setState(() {
      currentQuizQuestionIndex++;
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
                style: GoogleFonts.lato(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontWeight: FontWeight.bold,
                ),
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
