import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PlacesDetail extends StatefulWidget {
  const PlacesDetail({super.key, required this.headDetail});
  final String headDetail;
  @override
  State<PlacesDetail> createState() {
    return _PlacesDetailState();
  }
}

class _PlacesDetailState extends State<PlacesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.headDetail),
      ),
       body: Center(child: Text(widget.headDetail,
       style: TextStyle(color: Colors.white),),)
    );
  }
}
