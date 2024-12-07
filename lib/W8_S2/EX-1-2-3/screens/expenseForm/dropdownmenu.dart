import 'package:flutter/material.dart';
import 'package:fluttermain/W8_S2/EX-1-2-3/models/expense.dart';

class DropDownMenu extends StatelessWidget {
  final Category value;
  Function(Category) trigger;
  DropDownMenu({super.key,required this.trigger,required this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      value: value,
      items: Category.values.map((Category value) {
        return DropdownMenuItem<Category>(
          value: value,
          child: Text(value.name.toUpperCase()),
        );
      }).toList(),
      onChanged: (Category? newValue) {
        if (newValue != null) {
          trigger(newValue);
        }
      },
    );;
  }
}