import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 80,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: Color.fromARGB(149, 255, 255, 255),
          ),
          Text(
            "Learn Flutter the fun way",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 239, 213, 255),
            ),
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_right_alt),
            iconAlignment: IconAlignment.end,
          ),
        ],
      ),
    );
  }
}
