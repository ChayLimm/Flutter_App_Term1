import 'package:flutter/material.dart';
import 'package:fluttermain/W7_S1/lib/model/quiz.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:200 ,
      child: Card(
        color: Colors.white,        
        child: Center(
          child: Text(question.title,style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18
          ),),
        ),
      ),
    );
  }
}