import 'package:flutter/material.dart';
import '../../models/expense.dart';
import '../expenseForm/expenses_form.dart';
import 'expenses_list.dart';
import 'empty_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  Expense? removedExpense;
  int? removedIndex;

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void undoRemoved() {
    setState(() {
      _registeredExpenses.insert(removedIndex!, removedExpense!);
    });
  }

  void onExpenseRemoved(Expense expense, int index) {
    setState(() {
      removedExpense = expense;
      removedIndex = index;
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Removed sucessfully!'),
        action: SnackBarAction(label: "Undo", onPressed: undoRemoved),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red[300],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => FractionallySizedBox(
        heightFactor: 0.7,
        child: ExpenseForm(onCreated: onExpenseCreated),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onAddPressed,
            )
          ],
          backgroundColor: Colors.blue[700],
          title: const Text('Ronan-The-Best Expenses App'),
        ),
        body: _registeredExpenses.isNotEmpty
            ? ExpensesList(
                expenses: _registeredExpenses,
                onExpenseRemoved: onExpenseRemoved,
              )
            : Empty(
                triggerAdd: onAddPressed,
              ));
  }
}
