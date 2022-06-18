import 'package:flutter/material.dart';

class DogPage extends StatelessWidget {
  const DogPage({Key? key, required this.dogData}) : super(key: key);

  final Map dogData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(dogData['name'], style: const TextStyle(color: Colors.black),),
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
              Column(children: [
                const Padding(padding: EdgeInsets.all(8.0)),
                // ignore: prefer_interpolation_to_compose_strings
                Center(child: Text(dogData['origin'])),
                Center(child: Text(dogData['temperament'], textAlign: TextAlign.center,)),
                Center(child: Text(dogData['bred_for'])),
                Center(child: Text(dogData['life_span'])),
              ],
              ),
            ],
          ),
        )

        //Center(child: Image.network(dogData['image']['url'])),
        );
  }
}
