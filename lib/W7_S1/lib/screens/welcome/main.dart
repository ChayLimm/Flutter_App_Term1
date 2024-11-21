import 'package:flutter/material.dart';
import 'package:fluttermain/W7_S1/lib/model/quiz.dart';
import 'package:fluttermain/W7_S1/lib/screens/welcome/buttonStart.dart';
import 'package:fluttermain/W7_S1/lib/screens/question/question_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final Quiz quiz;
  const WelcomeScreen({super.key, required this.quiz});

  void toQuiz(BuildContext context){
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuestionScreen(questionList: quiz.questions)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              quiz.title,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Roboto',
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            Buttonstart(trigger:()=>  toQuiz(context)),
        
          ],
        ),
      ),
    );
  }
}
