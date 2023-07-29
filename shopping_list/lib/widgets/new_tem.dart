import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:shopping_list/data/dummy_items.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});
  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      var url = Uri.https(
          'flutter-database-22329-default-rtdb.asia-southeast1.firebasedatabase.app',
          'shopping-list.json');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "name": _enteredName,
            "quantity": _enteredQuantity,
            "category": _selectedCategory.title
          }));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(_enteredName);
      print(_enteredQuantity);
      print(_selectedCategory.title);

      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop();

      // Navigator.of(context).pop(GroceryItem(
      //     id: DateTime.now().toString(),
      //     name: _enteredName,
      //     quantity: _enteredQuantity,
      //     category: _selectedCategory));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    maxLength: 50,
                    decoration: const InputDecoration(
                        label: Text(
                      'name',
                      style: TextStyle(fontSize: 20),
                    )),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1 ||
                          value.trim().length > 50) {
                        return 'Must be between 1 and 50 charters.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _enteredName = value!;
                      });
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration:
                              const InputDecoration(label: Text('Quanliy')),
                          keyboardType: TextInputType.number,
                          initialValue: _enteredQuantity.toString(),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                int.tryParse(value) == null ||
                                int.tryParse(value)! <= 0) {
                              return 'Must be a valid, positive number.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _enteredQuantity = int.parse(value!);
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _selectedCategory,
                          items: [
                            for (final category in categories.entries)
                              DropdownMenuItem(
                                  value: category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: category.value.color,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(category.value.title)
                                    ],
                                  ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _isSending ? null : () {
                          _formKey.currentState!.reset();
                        },
                        child: const Text('Rest'),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed:_isSending ? null: _saveItem,
                        child: _isSending 
                        ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(),
                        ) 
                        :const Text('Add Item'),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
