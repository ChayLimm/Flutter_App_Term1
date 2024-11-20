import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final VoidCallback trigger;
  final bool isFavorite;
  final String title;
  final String discription;
  const FavoriteCard(
      {super.key,
      required this.title,
      required this.discription,
      required this.trigger,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(title),
      subtitle: Text(discription),
      trailing: IconButton(
          onPressed: trigger,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          )),
    ));
  }
}