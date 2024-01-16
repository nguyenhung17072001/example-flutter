import 'dart:io';

import 'package:camera/camera.dart';
import 'package:example/utils/index.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //camera
  Map<String, dynamic>? _timekeepingData;
  XFile? imageFile;
  List<CameraDescription> cameras = [];






  void testLocalAuth () async{
    final result = await BiometricUtils.instance.getBiometrics();
    print("result: $result");
  }

  Future<void> _getCamera() async {
    cameras = await availableCameras();
   
    // ignore: use_build_context_synchronously
    final XFile? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TimekeepingCamera(cameras: cameras)),
    );
    if (result != null) {
      setState(() {
        imageFile = result;
      });
    
   }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: testLocalAuth,
              child: Text('Test Sinh trắc học'),
            ),
            Column(
              children: [
                
                TextButton(
                  onPressed: _getCamera,
                  child: const Text('Camera chấm công'),
                ),
                Container(
                  child: imageFile != null
                  ? Image.file(
                    File(imageFile!.path),
                    width: 60, 
                    height: 60,
                    fit: BoxFit.cover,
                  )
                  : const SizedBox(),
                ),
              ],
            ),

          ],
        )
      ),
    );
  }
}