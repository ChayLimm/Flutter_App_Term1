import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermain/W8_S2/EX-1-2-3/screens/expenseForm/drop_down_menu.dart';
import '../../models/expense.dart';
import 'date_picker.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category category = Category.food;
  DateTime timeStamp = DateTime.now();

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void updateCategory(Category newCategory) {
    setState(() {
      category = newCategory;
    });
  }

  void updateTimeStamp(DateTime newTimeStamp) {
    setState(() {
      timeStamp = newTimeStamp;
    });
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
 
    if(_titleController.text.isEmpty){
      showAlert("Missing value","Title must be fill");
            return;

    }else if(_valueController.text.isEmpty){
      showAlert("Missing value","Amount must be fill");
      return;
    }   
  

    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

  

    // 2- Create the expense
    Expense expense = Expense(
        title: title, amount: amount, date: timeStamp, category: category);

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

  Future<void> showAlert(String title,String content)async {
     showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(title,style: const TextStyle(
          color: Colors.red
        ),),
        content: Text(content),
        actions: [
          TextButton(
            onPressed:onCancel, 
            child: const Text("Ok"))
        ],
      );
     });
  }
//  DropdownButton<Category> dropDown(Function(Category) trigger) {
//   Category dropDownValue = Category.food; // Initial value
//   return DropdownButton<Category>(
//     value: dropDownValue,
//     items: Category.values.map((Category value) {
//       return DropdownMenuItem<Category>(
//         value: value,
//         child: Text(value.name), // Display the category name
//       );
//     }).toList(),
//     onChanged: (Category? newValue) {
//       if (newValue != null) {
//         dropDownValue = newValue; // Update the selected value
//         trigger(newValue); // Call the trigger function with the selected value
//       }
//     },
//   );
// }


  

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
              DatePickerButton(
                trigger: updateTimeStamp,
              )
            ],
          ),
          DropDownMenu(trigger: updateCategory),
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
