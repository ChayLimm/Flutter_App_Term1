import 'package:flutter/material.dart';


class AddButton extends StatelessWidget {
  final VoidCallback trigger; 
  const AddButton({super.key,required this.trigger});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: trigger, icon: const Icon(Icons.add),color: Colors.white,);
  }
}