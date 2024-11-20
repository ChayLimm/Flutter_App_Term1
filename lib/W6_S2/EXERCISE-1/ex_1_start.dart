import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Label("Method 1: Loop in Array", bold: true),
            for (var item in colors)
              Label(item),
            	


            // TODO
            const Label("Method 2: Loop in Array", bold: true),
            ...colors.map((toELement) => Label(toELement, bold: false)),

            // TODO
            Label("Method 3: Dedicated Function", bold: true),
            // TODo
            ...loopLabel().map((toElement) => toElement)
          ],
        ),
      ),
    );
  }
}

List<Label> loopLabel() {
  return colors
      .map((toELement) => Label(toELement, bold: false))
      .toList();
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
