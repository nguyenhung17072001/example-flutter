import 'package:flutter/material.dart';
import 'dart:async';
import '../components/my_text_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  /// Holds the _category, model of the current selected control
 
  @override
  State<StatefulWidget> createState() => LayoutPageState();
}

class LayoutPageState extends State<LoginScreen> {

  
  @override
  Widget build(BuildContext context) {





    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color.fromRGBO(45, 182, 163, 100),
          child: Column(
            children: [
              Flexible(
                
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  width: 300,
                  child: Image.asset('lib/src/assets/images/login.png', fit: BoxFit.contain,),
                )
              ),
              Container(
                child: AuthTextField(
                  icon: const Icon(Icons.mail),
                  labelText: 'Email',
                ),
              ),
              Container(
                child: AuthTextField(
                  icon: const Icon(Icons.mail),
                  labelText: 'Emailsss',
                ),
              ),
            ]
          ),
        )
      )
    );
  }

}

