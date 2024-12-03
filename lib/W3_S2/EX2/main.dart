import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
          padding: const EdgeInsets.all(40),
          margin: const EdgeInsets.all(50),
          color: Colors.blue[300],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue[600],
            ),
            child: const Center(
              child: Text("CADT STUDENTS",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500
              ),)
            ),
          ),
        
      ),
    );
  }
}
