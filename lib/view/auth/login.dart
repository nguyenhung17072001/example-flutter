import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            child: Image.asset(
              'assets/login.png',
              fit: BoxFit.contain,
            )
          ),
          Text('hung jr')
        ],
      )
    );
  }
}