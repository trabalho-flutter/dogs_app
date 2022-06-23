// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class DogPage extends StatelessWidget {
  const DogPage({Key? key, required this.dogData}) : super(key: key);

  final Map dogData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          dogData['name'],
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.network(dogData['image']['url']),
            Column(
              children: [
                const Padding(padding: EdgeInsets.all(8.0)),
                // ignore: prefer_interpolation_to_compose_strings
                Center(
                  // ignore: prefer_interpolation_to_compose_strings
                  child: Text( 
                    dogData['origin'] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  // ignore: prefer_interpolation_to_compose_strings
                  child: Text(
                    dogData['temperament'] ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  // ignore: prefer_interpolation_to_compose_strings
                  child: Text(
                    dogData['bred_for'] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  // ignore: prefer_interpolation_to_compose_strings
                  child: Text(
                    dogData['life_span'] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.favorite),
        onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text('Favorite Added'),
                    ),
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    )
                  ],
                ),
              ),
          ),
        );
      }
      ),
    );
  }
}
