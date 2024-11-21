import 'package:flutter/material.dart';
// import 'package:fluttermain/W3_S2/EX1/main.dart';
// import 'package:fluttermain/W3_S2/EX2/main.dart';
//  import 'package:fluttermain/W3_S2/EX3/main.dart';
// import 'package:fluttermain/W4_S1/EX1/main.dart';
// import 'package:fluttermain/W4_S1/EX2/main.dart';
// import 'package:fluttermain/W4_S1/EX3/main.dart';
// import 'package:fluttermain/W4_S1/challenge/main.dart';
// import 'package:fluttermain/lessonOfThwDay/rolldice.dart';
// import 'package:fluttermain/lessonOfThwDay/discountCard.dart';
// import 'package:fluttermain/W4_S3/EX1/main.dart';
// import 'package:fluttermain/W4_S3/EX2/main.dart';
// import 'package:fluttermain/W4_S3/EX3/main.dart';
// import 'package:fluttermain/W3_S2/EX3/main.dart';
// import 'package:fluttermain/W4_S3/challenge/main.dart';
// import 'package:fluttermain/W4_S1/EX1/main.dart';
// import 'package:fluttermain/W4_S1/EX2/main.dart';
// import 'package:fluttermain/W4_S1/challenge/main.dart';
// import 'package:fluttermain/lessonOfThwDay/layout.dart/activity1.dart';
// import 'package:fluttermain/W6_S2/EXERCISE-1/ex_1_start.dart';
// import 'package:fluttermain/W6_S2/EXERCISE-2/main_start.dart';
// import 'package:fluttermain/W6_S2/EXERCISE-3/main.dart';
// import 'package:fluttermain/W6_S2/EXERCISE-4/main.dart';
// import 'package:fluttermain/W6_S2/challenge/main.dart';
import 'package:fluttermain/W7_S1/lib/main.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    
    MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}


