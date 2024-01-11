import 'package:example/utils/index.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MediaManagement extends StatefulWidget {
  const MediaManagement({super.key});

  @override
  State<MediaManagement> createState() => _MediaManagementState();
}

class _MediaManagementState extends State<MediaManagement> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readStorage();
  }




  void _readStorage()async {
    try{
      final ListResult result = await FirebaseUtils.instance.readStorage("test/images");
      print(result.items);
    } catch(e){
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}