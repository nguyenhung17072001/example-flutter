import 'package:flutter/material.dart';




class FoodDetail extends StatelessWidget {
  final Map? params;
  const FoodDetail({this.params, super.key});

  @override
  Widget build(BuildContext context) {
    print('hunnnnnnnnn $params');
    return Scaffold(
      appBar: AppBar(
        title: Text(params?['name']),
        backgroundColor: const Color.fromRGBO(45, 182, 163, 100),
        //iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}