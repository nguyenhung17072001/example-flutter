import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  void testLocalAuth () async{
    final result = await BiometricUtils.instance.getBiometrics();
    print("result: $result");
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextButton(
          onPressed: testLocalAuth,
          child: Text('Test Sinh trắc học'),
        )
      ),
    );
  }
}