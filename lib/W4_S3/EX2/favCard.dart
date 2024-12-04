import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  const FavoriteCard(
      {super.key, required this.title, required this.description});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool trigger = false;
  Color get buttoncolor => trigger ? Colors.red : Colors.grey;

  void _triggerFav() {
    setState(() {
      trigger = !trigger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          ),
          IconButton(
              onPressed: _triggerFav,
              icon: Icon(Icons.favorite, color: buttoncolor))
        ],
      ),
    );
  }
}
