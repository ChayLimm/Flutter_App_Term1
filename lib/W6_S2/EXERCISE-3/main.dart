import 'package:flutter/material.dart';
import 'package:fluttermain/W6_S2/EXERCISE-3/screen/temperature.dart';
// import 'package:test1/W5-S2-List-Inputs/1%20-%20START%20CODE/EXERCISE-3/screen/welcome.dart';
import 'package:fluttermain/W6_S2/EXERCISE-3/screen/welcome.dart';

enum Page{
  temperature,
  welcome
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var currentPage = Page.welcome;

  void switchPage(){
    setState(() {
      currentPage = Page.temperature;
    });
  }
  
  @override
  Widget build(context) {
    var page;

    switch(currentPage){
      case Page.temperature:
        page = Temperature();
        break;
      case Page.welcome:
        page = Welcome(trigger: switchPage,);
        break;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: page
          ,
        ),
      ),
    );
  }
}


