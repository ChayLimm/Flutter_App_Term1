import 'package:fluttermain/W8_S1/models/expense.dart';

  List<Expense> fakeExpenses = [
    Expense(
      title: 'Lunch at Cafe',
      amount: 12.99,
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: Category.food,
    ),
    Expense(
      title: 'Taxi to Office',
      amount: 8.50,
      date: DateTime.now().subtract(const Duration(hours: 5)),
      category: Category.travel,
    ),
    Expense(
      title: 'Movie Night',
      amount: 15.00,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: Category.leisure,
    ),
  ];
