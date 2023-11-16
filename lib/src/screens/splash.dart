import 'package:flutter/material.dart';
import 'dart:async';


class Splash extends StatelessWidget {
  //const Splash({super.key});
  
  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });


    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          //color: Colors.red,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                
                height: 100,
                width: 100,
                child: Image.asset(
                  'lib/src/assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Foodienator', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }

}