import 'package:flutter/material.dart';
import 'device_converter.dart';

class DropDownMenu extends StatefulWidget {
  final Function(Currency) trigger ;
  const DropDownMenu({super.key, required this.trigger});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {

  Currency selected = Currency.euro;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
       items: Currency.values.map<DropdownMenuItem<Currency>>((Currency value) {
            return DropdownMenuItem<Currency>(
              value: value,
              child: Text(value.name), 
            );
          }).toList(),
      onChanged: (Currency? newValue) {
        widget.trigger(newValue!);
        selected = newValue;
      },
      value: selected,
      
      );
  }
}