import 'package:flutter/material.dart';

class CustomeCard extends StatelessWidget {
  final String title;
  final Color color;
  final Color gradient;
  const CustomeCard({super.key, 
  required this.title, 
  required this.gradient,
  this.color = Colors.blue, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            color,
            gradient
          ])
        ),
        child: Center(
          child: Text(title,style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }
}
