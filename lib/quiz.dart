import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  final List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length >= questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void onRestartQuiz() {
    setState(() {
      activeScreen = 'question-screen';
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : activeScreen == 'question-screen'
              ? QuestionScreen(onAnswer: onAnswer)
              : ResultScreen(
                  onRestartQuiz: onRestartQuiz,
                  selectedAnswers: selectedAnswers,
                ),
        ),
      ),
    );
  }
}
