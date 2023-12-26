import 'package:flutter/material.dart';

import '../../theme/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        //color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.width *0.5,
              width: MediaQuery.of(context).size.width *0.5,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              )
            ),
            Text('hung jr')
          ],
        ),
      )
    );
  }
}