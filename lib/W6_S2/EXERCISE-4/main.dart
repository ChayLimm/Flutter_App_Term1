import 'package:flutter/material.dart';
import 'package:fluttermain/W6_S2/EXERCISE-4/data/data.dart';
import 'package:fluttermain/W6_S2/EXERCISE-4/screen/favoriteCard.dart';

Color appColor = Colors.green[300] as Color;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? favoriteIndex;

  void toggle(int index) {
    setState(() {
      if (index == favoriteIndex) favoriteIndex = null;
      else favoriteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < jokeList.length; i++)
            FavoriteCard(
                title: jokeList[i].title,
                discription: jokeList[i].discription,
                isFavorite:  i == favoriteIndex,
                trigger: () => toggle(i))
        ],
      ),
    ));
  }
}
