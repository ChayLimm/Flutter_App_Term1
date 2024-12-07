import 'package:flutter/material.dart';
import 'package:fluttermain/W9_S2/models/grocery_item.dart';

class ItemCard extends StatelessWidget {
  final GroceryItem item;
  const ItemCard({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.square,color: item.category.color,),
      title: Text(item.name),
      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
      subtitle: Text("Quantity : ${item.quantity}"),

    );
  }
}