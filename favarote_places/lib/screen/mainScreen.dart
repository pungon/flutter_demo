import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:favarote_places/models/list-model.dart';
import 'package:favarote_places/data/demo_data.dart';

import 'package:favarote_places/screen/NewItem.dart';
import 'package:favarote_places/screen/placesDetail.dart';

import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final List<GroceryItem> _groceryItems = groceryItems;
  List<ListModel> _dataItems = [];
  var HeadDetail = '';
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  void _loadItem() async {
    final url = Uri.https(
        'flutter-database-22329-default-rtdb.asia-southeast1.firebasedatabase.app',
        'favarote_places.json');

    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    if (response.body == "null") {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<ListModel> _loadedUtems = [];
    for (final item in listData.entries) {
      _loadedUtems.add(ListModel(
        title: item.value['title'],
      ));
    }
    setState(() {
      _dataItems = _loadedUtems;
      _isLoading = false;
    });
  }

  void _placesDetail() async {
    await Navigator.of(context).push<ListModel>(
      MaterialPageRoute(builder: (ctx) => PlacesDetail(headDetail: HeadDetail)),
    );
  }

  void _addItem() async {
    await Navigator.of(context).push<ListModel>(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
    _loadItem();
  }

  void _removeItem(ListModel item) async {
    setState(() {
      _dataItems.remove(item);
    });

    final url = Uri.https(
        'flutter-database-22329-default-rtdb.asia-southeast1.firebasedatabase.app',
        'shopping-list/${item.title}.json');

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _dataItems.add(item);
        print('undo');
      });
    } else {
      print('delete success');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No places added yet'),
    );
    if (_isLoading == true) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_dataItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: _dataItems.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
              onDismissed: (direction) {
                _removeItem(_dataItems[index]);
                _placesDetail();
              },
              key: ValueKey(_dataItems[index].title),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    HeadDetail = _dataItems[index].title;
                  });
                  _placesDetail();
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors
                      .transparent), // กำหนด overlay color เป็น transparent
                ),
                child: ListTile(
                  title: Text(_dataItems[index].title),

                  // trailing: Text(_groceryItems[index].quantity.toString()),
                ),
              ),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(onPressed: _addItem, icon: const Icon(Icons.add))
          ],
        ),
        body: content);
  }
}
