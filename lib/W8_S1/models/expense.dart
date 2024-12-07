import 'package:uuid/uuid.dart';

enum Category{
  food,
  travel,
  leisure,
  work,
}


class Expense{
  late String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({required this.title, required this.amount, required this.date,required this.category}){
    id = const Uuid().v4();
  }
}