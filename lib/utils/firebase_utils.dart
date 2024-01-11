import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUtils {
  static final FirebaseUtils instance = FirebaseUtils._getInstance();
  FirebaseUtils._getInstance();
  final _firebaseApp = Firebase.app();



  //realtime database
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  Future<void> setData (String path, Map data)async {
    Completer completer = Completer();
    DatabaseReference ref = _database.ref(path);
    try {
      await ref.set(data);
      
    } catch (e) {
      print(e);
      completer.completeError(e);
    }


  }


  Future readData(String path)async {
    Completer completer = Completer();
    
    try {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child(path).get();
      //print(snapshot.value);
      completer.complete(snapshot.value);
          
     
      
    } catch(e) {
      completer.completeError(e);
    }
    return completer.future;
  }


  //FirebaseStorage
  final _storageRef = FirebaseStorage.instance.ref();


  Future<void> uploadFileStorage(String path, File file, String contentType)async {
    Completer completer = Completer();
    try{
      final SettableMetadata metadata = SettableMetadata(
        cacheControl: "public,max-age=300",
        contentType: contentType,
      );
      final mountainsRef = _storageRef.child(path);
      await mountainsRef.putFile(file);
      await mountainsRef.updateMetadata(metadata);
    } on FirebaseException catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
  
}