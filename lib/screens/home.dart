import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  final uri = Uri.parse(
      'https://api.thedogapi.com/v1/breeds?key=e548d94e-2101-4ec4-a11e-48141783e241&limit=20');

  Future<List> _getBreeds() async {
    http.Response response;
    response = await http.get(uri);

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    //_getBreeds().then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'The Dogs App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(children: [

      ]),
    );
  }
}
