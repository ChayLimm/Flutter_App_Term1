import 'package:flutter/material.dart';

import 'screens/expenses/expenses.dart';
 

// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Expenses(),
//     ),
//   );
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expenses();
  }
}