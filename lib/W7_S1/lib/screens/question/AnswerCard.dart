import 'package:flutter/material.dart';

class Answercard extends StatelessWidget {
  final String possibleAnswer;
  const Answercard({super.key, required this.possibleAnswer});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        color: Colors.white,        
        child:ListTile(
          leading: Text(possibleAnswer,style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),),
        ),
      ),
    );
  }
}