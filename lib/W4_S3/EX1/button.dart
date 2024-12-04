import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {

  bool selected = false;
  String get text => selected ? "Selected" : "Not Selected";
  Color get textColor => selected ? Colors.white : Colors.black;
  Color get buttonColor => selected ? Colors.blue : const Color.fromARGB(255, 185, 233, 255);

  void _onPressed() {
    print("pressing");
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 80,
      child: ElevatedButton(
          onPressed: _onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, color: textColor),
          )),
    );
  }
}
