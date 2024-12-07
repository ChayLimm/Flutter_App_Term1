import 'package:fluttermain/W7_S1/lib/model/quiz.dart';

class Answer {
  String answer; // answer can be update so i remove final
  final Question question;
  Answer({required this.answer,required this.question});
  
  bool isCorrect(){    
    if( question.goodAnswer == answer){
      return true;
    }else {
      return false;
    }
  }
}

class Submission {
  List<Answer> answerList = [];

  int getScore(){
    int totalScore = 0;
    for(var item in answerList){
      if(item.isCorrect()){
        totalScore++;
      }
    }
    return totalScore;
  }

  Answer? getAnswerFor(Question question){
    for(var item in answerList){
      if(item.question == question){
        return item;
      }
    }
    return null;
  }
  
  void addAnswer(Question question, String answer) {
     Answer asAnswer = Answer(
        question: question,
        answer: answer,
      );
    // check to update before adding a new one avoiding redondance data
    for (var item in answerList) {
    if (item.question == asAnswer.question) {
      item.answer = asAnswer.answer; 
      return; 
    }
  }

   answerList.add(asAnswer);

  }
 
  void removeAnswer() {
    answerList.clear();
  }

 

}