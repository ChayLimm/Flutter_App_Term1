import 'package:flutter/material.dart';
import 'package:fluttermain/W8_S2/EX-1-2-3/models/expense.dart';

class DropDownMenu extends StatefulWidget {
  final Function(Category) trigger;
  const DropDownMenu({super.key, required this.trigger});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {

  Category _valueController = Category.food;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Category>(
      items: Category.values.map((Category value) {
            return DropdownMenuItem<Category>(
              value: value,
              child: Text(value.toString().split('.').last),  // Extract the string part
            );
          }).toList(),
      onChanged:(Category? newValue){
        widget.trigger(newValue!);   
        setState(() {
          _valueController = newValue;
        });   
        } ,
        value: _valueController,
      );
  }
}