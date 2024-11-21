import 'package:fluttermain/W7_S1/lib/data/dataProvider.dart';
import 'package:fluttermain/W7_S1/lib/model/quiz.dart';
import 'package:fluttermain/W7_S1/lib/model/submission.dart';
import 'dart:io';

void main(){
  print(game1.title);

  List<Question> questionList = game1.questions;
  Submission submit = Submission();

  for(var item in questionList){
    print(item.title);
    for(var answer in item.possibleAnswers){
      print(answer);
    }
    String choice;
    stdout.write("Enter your choice: ");
    choice = stdin.readLineSync() ?? ' ';
    submit.addAnswer(item, choice);
    // print('user choice: $choice');
  }
    submit.removeAnswer();
    print(submit.getScore());
  


  // switch (choice) {
  //   case 'Ronan':
  //     print('Correct!');      
  //     break;
  //   default:
  // }
  
}