import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import this for DateFormat

class DatePickerButton extends StatefulWidget {
  final Function(DateTime) trigger;
  const DatePickerButton({super.key, required this.trigger});

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  TextEditingController _dateController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? _pickdate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: DateTime.now(),
    );
    if (_pickdate != null) {
      setState(() {
        widget.trigger(_pickdate);
        // Format the date to a more readable format (e.g., "yyyy-MM-dd")
        _dateController.text = DateFormat('yyyy-MM-dd').format(_pickdate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: 200,
      child: TextField(
        controller: _dateController,
        decoration: const InputDecoration(
          labelText: "Date",
          filled: true,
          prefixIcon: Icon(Icons.calendar_month),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
        readOnly: true,
        onTap: selectDate, // Corrected this to call selectDate function
      ),
    );
  }
}
