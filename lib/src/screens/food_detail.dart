import 'package:example/src/components/photo_view.dart';
import 'package:flutter/material.dart';




class FoodDetail extends StatelessWidget {
  final Map? params;
  const FoodDetail({this.params, super.key});

  @override
  Widget build(BuildContext context) {
    //print('hunnnnnnnnn $params');
    return Scaffold(
      appBar: AppBar(
        title: Text(params?['name']),
        backgroundColor: const Color.fromRGBO(45, 182, 163, 100),
        //iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageView(image: params?['image']),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                width: 200,
                child: Image.asset(params?['image'], fit: BoxFit.contain,)
              ),
            ),
            Text(params?['price'], style: const TextStyle(fontSize: 14, color: Colors.black),),
          ],
          
        )
      ),
    );
  }
}