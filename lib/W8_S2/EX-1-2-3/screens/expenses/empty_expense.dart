import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  final VoidCallback triggerAdd;
  const Empty({super.key, required this.triggerAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "The expense list is empty try add something",
        ),
        const SizedBox(
          height: 44,
        ),
        ElevatedButton(
          onPressed: triggerAdd,
          child: const Text("Add Expense"),
        )
      ],
    ));
  }
}
