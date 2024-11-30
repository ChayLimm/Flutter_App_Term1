import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'es';
    var format = DateFormat.yMd().format(expense.timeStamp);
    Icon icon;
    switch (expense.category) {
      
      case Category.food:
        icon = const Icon(Icons.fastfood);
        break;
      case Category.travel:
        icon = const Icon(Icons.travel_explore);
        break;
      case Category.leisure:
        icon = const Icon(Icons.flight);
        break;
      case Category.work:
        icon = const Icon(Icons.work);
        break;
    }

    return Card(
      child: ListTile(
        title: Text(
          expense.title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "${expense.amount.toString()}\$",
          style: const TextStyle(color: Colors.green),
        ),
        trailing:Container(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               icon,
               const SizedBox(width: 10),
               Text(
           format,
            style: const TextStyle(fontSize: 14)),
            ],
          ),
        )
      ),
    );
  }
}
