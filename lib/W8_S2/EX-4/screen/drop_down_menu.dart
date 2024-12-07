import 'package:flutter/material.dart';
import 'device_converter.dart';

class DropDownMenu extends StatelessWidget {
  final Currency selectedCurrency;
  final Function(Currency) trigger ;
  const DropDownMenu({super.key, required this.trigger, required this.selectedCurrency});


  @override
  Widget build(BuildContext context) {
    return DropdownButton(
       items: Currency.values.map<DropdownMenuItem<Currency>>((Currency value) {
            return DropdownMenuItem<Currency>(
              value: value,
              child: Text(value.name.toUpperCase()), 
            );
          }).toList(),
      onChanged: (Currency? newValue) {
        trigger(newValue!);
      },
      value: selectedCurrency,      
      );
  }
}