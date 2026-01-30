import 'package:adv_basics/data/questions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<String> selectedAnswers;

  const QuestionSummary({super.key, required this.selectedAnswers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: questions.mapIndexed((index, question) {
            String? selectedAnswer = index < selectedAnswers.length
                ? selectedAnswers[index]
                : null;
            String correctAnswer = question.answers[0];
            bool isUserCorrect = correctAnswer == selectedAnswer;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isUserCorrect
                        ? Color.fromARGB(255, 95, 188, 230)
                        : Color.fromARGB(255, 253, 99, 99),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        selectedAnswer ?? "",
                        style: TextStyle(
                          color: const Color.fromARGB(203, 203, 155, 248),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        correctAnswer,
                        style: TextStyle(
                          color: const Color.fromARGB(203, 101, 198, 237),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
