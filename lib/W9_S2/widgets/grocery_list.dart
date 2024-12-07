import 'package:flutter/material.dart';
import 'package:fluttermain/W9_S2/models/grocery_item.dart';
import 'package:fluttermain/W9_S2/widgets/itemcard.dart';
import 'package:fluttermain/W9_S2/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: dummyGroceryItems.length,
          itemBuilder: (context, index) =>
              ItemCard(item: dummyGroceryItems[index]));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewItem(),
                  ),
                )
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: content);
  }
}
