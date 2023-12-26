
import 'package:flutter/material.dart';

import 'di/injection_container.dart';
import 'my_app.dart';



void main() async {
  //const flavor = String.fromEnvironment('flavor', defaultValue: 'dev');
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();



  runApp(const MyApp());
}
