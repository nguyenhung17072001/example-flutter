import 'package:flutter/material.dart';
import 'src/screens/splash.dart';
import 'src/navigation/navigation_container.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationContainer(),
    );
  }
}


