
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'di/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'my_app.dart';



void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //await Firebase.initializeApp();
  //const flavor = String.fromEnvironment('flavor', defaultValue: 'dev');
 
  //await Firebase.initializeApp();



  runApp(const MyApp());
  
}




