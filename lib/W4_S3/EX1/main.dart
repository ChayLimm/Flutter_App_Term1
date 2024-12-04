import 'package:flutter/material.dart';
import 'package:fluttermain/W4_S3/EX1/button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SelectButton(),
        SelectButton(),
        SelectButton(),
        SelectButton(),
      ],),
    );
  }
}



