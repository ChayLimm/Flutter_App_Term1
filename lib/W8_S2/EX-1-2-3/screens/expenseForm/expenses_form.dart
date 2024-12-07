import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermain/W8_S2/EX-1-2-3/screens/expenseForm/dropdownmenu.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  Category selectedCategory = Category.food;
  DateTime selectedDate = DateTime.now();

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void updateCategory(Category newCategory) {
    setState(() {
      selectedCategory = newCategory;
    });
  }

  void updateTimeStamp(DateTime newTimeStamp) {
    setState(() {
      selectedDate = newTimeStamp;
    });
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    if (_titleController.text.isEmpty) {
      showAlert("Missing value", "Title must be fill");
      return;
    } else if (_valueController.text.isEmpty) {
      showAlert("Missing value", "Amount must be fill");
      return;
    }

    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectedDate,
        category: selectedCategory);

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);

    //snack bar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Add sucessfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: DateTime.now(),
    );
    if (pickdate != null) {
      setState(() {
        updateTimeStamp(pickdate);
      });
    }
  }

  Future<void> showAlert(String title, String content) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(color: Colors.red),
            ),
            content: Text(content),
            actions: [TextButton(onPressed: onCancel, child: const Text("Ok"))],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 72,
                width: 150,
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('dd-MM-yyyy').format(selectedDate)),
                    IconButton(
                        onPressed: selectDate,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          DropDownMenu(value: selectedCategory, trigger: updateCategory),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          )
        ],
      ),
    );
  }
}
