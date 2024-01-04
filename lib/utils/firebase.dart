import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'xxxxxxxxxxxxxxxxxxx',
    appId: 'xxxxxxxxxxxxxxxxxxx',
    messagingSenderId: 'xxxxxxxxxxxxxxxxxxx',
    projectId: 'xxxxxxxxxxxxxxxxxxx',
    authDomain: 'xxxxxxxxxxxxxxxxxxx',
    databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'xxxxxxxxxxxxxxxxxxx',
    measurementId: 'xxxxxxxxxxxxxxxxxxx',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDksuXwXtD6zucsKxzbMYOCi7DbJOci-Rk',
    authDomain: 'flutter-demo-991ec.firebaseapp.com',
    appId: '1:367663076041:android:6883f257e234dc0f683318',
    messagingSenderId: 'sender-id',
    projectId: 'flutter-demo-991ec',
    databaseURL: 'https://flutter-demo-991ec-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-demo-991ec.appspot.com',
    measurementId: '367663076041',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'xxxxxxxxxxxxxxxxxxx',
    appId: 'xxxxxxxxxxxxxxxxxxx',
    messagingSenderId: 'xxxxxxxxxxxxxxxxxxx',
    projectId: 'xxxxxxxxxxxxxxxxxxx',
    databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'xxxxxxxxxxxxxxxxxxx',
    androidClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosBundleId: 'xxxxxxxxxxxxxxxxxxx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'xxxxxxxxxxxxxxxxxxx',
    appId: 'xxxxxxxxxxxxxxxxxxx',
    messagingSenderId: 'xxxxxxxxxxxxxxxxxxx',
    projectId: 'xxxxxxxxxxxxxxxxxxx',
    databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'xxxxxxxxxxxxxxxxxxx',
    androidClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosBundleId: 'xxxxxxxxxxxxxxxxxxx',
  );
}