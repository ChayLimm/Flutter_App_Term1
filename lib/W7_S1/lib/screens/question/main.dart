import 'package:flutter/material.dart';
import 'package:fluttermain/W7_S1/lib/model/quiz.dart';
import 'package:fluttermain/W7_S1/lib/screens/question/AnswerCard.dart';
import 'package:fluttermain/W7_S1/lib/screens/question/Card.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String) submitAnswer;
  const QuestionScreen({super.key, required this.question,required this.submitAnswer});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 44),
            QuestionCard(question: question),
            const SizedBox(height: 44),
            for (var item in question.possibleAnswers)
              Answercard(
                possibleAnswer: item,
                trigger: submitAnswer,
              ),
          ],
        ),
      ),
    );
  }
}
