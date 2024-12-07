import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController titleController = TextEditingController(text: " ");
    TextEditingController quantityController = TextEditingController(text: "1");
    GroceryCategory selectedCategory = GroceryCategory.carbs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                // onSaved: (newValue) => ,
                controller: titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please input the name";
                  }
                  return null;
                },
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: quantityController,
                       validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please input quantity";
                          }
                          if (int.tryParse(value) == null) {
                            return "Please input a valid number";
                          }
                          return null;
                        },
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: selectedCategory,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        selectedCategory = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // _formKey.currentState!.reset();
                      titleController.clear();
                      quantityController.clear();
                      selectedCategory = GroceryCategory.carbs;
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      if (_formKey.currentState!.validate())
                        {
                          dummyGroceryItems.add(GroceryItem(
                              id: DateTime.now().toString(),
                              name: titleController.text,
                              quantity: int.parse(quantityController.text),
                              category: selectedCategory))
                        }
                    },
                    child: const Text('Add Item'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
