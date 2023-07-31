
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
  var _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      var url = Uri.https(
          'flutter-database-22329-default-rtdb.asia-southeast1.firebasedatabase.app',
          'favarote_places.json');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode({
            "title": _enteredName,
            
          }));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(_enteredName);
 
     

      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop();


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
                      'title',
                      style: TextStyle(fontSize: 20),
                    )
                    ), style: TextStyle(color: Colors.white),
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
                  const SizedBox(
                        height: 16,
                      ),
                   Container(
                    width: 120,
                    child: ElevatedButton(
                      onPressed:_isSending ? null: _saveItem,
                      child: _isSending 
                      ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(),
                      ) 
                      :Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.add), // Icon ที่คุณต้องการเพิ่ม
                            SizedBox(width: 8), // ระยะห่างระหว่าง Icon กับ Text
                            Text('Add Item'),
                          ],
                        ),
                  
                    ),
                  ),
                  
              ])
              )
              )       
              ); 
  }
}