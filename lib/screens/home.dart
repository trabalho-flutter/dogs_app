import 'dart:convert';

import 'package:dogs_app/screens/dog.dart';
import 'package:flutter/material.dart';
import 'package:dogs_app/screens/dog.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late String? _search = '';

  late final Uri uri;

  Future<List> _getBreeds() async {
    http.Response response;
    // ignore: unnecessary_null_comparison
    if (_search == '') {
      uri = Uri.parse(
          'https://api.thedogapi.com/v1/breeds?key=e548d94e-2101-4ec4-a11e-48141783e241');
    } else {
      uri = Uri.parse(
          'https://api.thedogapi.com/v1/breeds/search?q=$_search&key=e548d94e-2101-4ec4-a11e-48141783e241');
    }
    response = await http.get(uri);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'The Dogs App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder()),
              style: const TextStyle(color: Colors.black, fontSize: 15.0),
              textAlign: TextAlign.center,
              onSubmitted: (text) {
                setState(() {
                  _search = text;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getBreeds(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Center(
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                          strokeWidth: 5.0,
                        ),
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return _createBreedsTable(context, snapshot);
                    }
                }
              },
            ),
          )
        ]),
      ),
    );
  }

  Widget _createBreedsTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>DogPage(dogData: snapshot.data[index])
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      snapshot.data[index]['image']['url'],
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Text(
                      snapshot.data[index]['name'],
                      style: const TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
