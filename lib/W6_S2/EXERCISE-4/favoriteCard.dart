import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
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
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(widget.title),
      subtitle: Text(widget.discription),
      trailing: IconButton(
          onPressed: widget.trigger,
          icon: Icon(
            widget.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: widget.isFavorite ? Colors.red : Colors.grey,
          )),
    ));
  }
}