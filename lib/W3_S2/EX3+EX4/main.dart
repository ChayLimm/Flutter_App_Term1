import 'package:flutter/material.dart';
import 'package:fluttermain/W3_S2/EX3+EX4/card.dart';

//i accidentally do EX4

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 200),
        color: const Color(0xFFBBBBBB),
        child: const Column(
          children: [
            CustomeCard(title: "OOP", color: Colors.red,gradient: Colors.orange,),
            CustomeCard(title: "Dart",color: Colors.blue, gradient: Colors.purple,),
            CustomeCard(title: "Flutter", color: Colors.green, gradient: Colors.yellow),
          ],
        ),
      ),
    );
  }
}
