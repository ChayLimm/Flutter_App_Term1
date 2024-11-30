
import 'package:flutter/material.dart';
import 'package:fluttermain/W6_S2/EXERCISE-1/ex_1_start.dart';
import '../W8_S1/data/testing.dart';
import 'screens/homepage/main.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var inputTitle ;
  var inputAmount;

  void addMore(){
    showModalBottomSheet
    (context: context, 
    builder: (context)=> Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical:44),
      child: Column(children: [
         TextField(
          keyboardType:  TextInputType.number,
           inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,

            ],
            maxLength: 50,
          decoration: const InputDecoration(
            
            labelText: 'Enter Amount', 
            prefixText: '\$', 
          ),
        ),
      ],),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ExpenseApp(expenseList: fakeExpenses, trigger: addMore,);
  }
}