
import 'package:flutter/material.dart';
import '../W8_S1/data/testing.dart';
import '../W8_S1/screens/main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpenseApp(expenseList: fakeExpenses);
  }
}