import 'package:fluttermain/W7_S1/lib/model/quiz.dart';

class Answer {
  final String questionsAnswer;
  final Question question;
  Answer({required this.questionsAnswer,required this.question});
  
  bool isCorrect(){    
    if( question.goodAnswer == questionsAnswer){
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
        questionsAnswer: answer,
      );
    answerList.add(asAnswer);
  }
 
  void removeAnswer() {
    answerList.clear();
  }

 

}