import 'package:flutter/material.dart';
import 'package:fluttermain/W7_S1/lib/model/quiz.dart';
import 'package:fluttermain/W7_S1/lib/model/quiz.dart';
import 'package:fluttermain/W7_S1/lib/screens/question/AnswerCard.dart';
import 'package:fluttermain/W7_S1/lib/screens/question/Card.dart';
 
class QuestionScreen extends StatefulWidget {
  final List<Question> questionList;
  const QuestionScreen({super.key, required this.questionList});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  int currentIndex = 0;


  void triggerToNextStage(int currentIndex){
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {

    Question currentQuestion = widget.questionList[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFEFF0F3),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
              const SizedBox(height: 44),
              QuestionCard(question: currentQuestion,),
              const SizedBox(height: 44),
              for(var item in currentQuestion.possibleAnswers)
                Answercard(possibleAnswer: item)
            
          ],
        ),
      ),
    );
  }
}
 