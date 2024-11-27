import 'package:flutter/material.dart';
import 'package:fluttermain/W8_S1/models/expense.dart';
import '../screens/card.dart';
import '../widgets/addButton.dart';


class ExpenseApp extends StatefulWidget {
  final List<Expense> expenseList;
  const ExpenseApp({super.key, required, required this.expenseList});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {

  void addCard(){

  }
  
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
          AddButton(trigger: addCard)
        ],
      ),
      body: ListView.builder(
          itemCount: widget.expenseList.length,
          itemBuilder: (context, index) =>
              ExpenseCard(expense: widget.expenseList[index])),
    );
  }
}
