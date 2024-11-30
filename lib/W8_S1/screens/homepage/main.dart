import 'package:flutter/material.dart';
import 'package:fluttermain/W8_S1/models/expense.dart';
import 'expenseCard.dart';
import '../../widgets/addButton.dart';


class ExpenseApp extends StatelessWidget {
  final List<Expense> expenseList;
  final VoidCallback trigger;
  const ExpenseApp({super.key, required, required this.expenseList, required this.trigger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ronan the best expense tracker",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          AddButton(trigger: trigger)
        ],
      ),
      body: ListView.builder(
          itemCount: expenseList.length,
          itemBuilder: (context, index) =>
              ExpenseCard(expense: expenseList[index])),
    );
  }
}
