import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TimekeepingCamera extends StatefulWidget {
  final List<CameraDescription> cameras;

  const TimekeepingCamera({super.key, required this.cameras});
  @override
  _TimekeepingCameraState createState() => _TimekeepingCameraState();
}

class _TimekeepingCameraState extends State<TimekeepingCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  XFile? image;
  bool isCamera = true;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[1], ResolutionPreset.veryHigh);
    _initializeControllerFuture = _controller.initialize();

  }

 

  void _takePicture() async {
    try {
      // Ensure the controller is initialized before taking a picture
      await _initializeControllerFuture;
      image = await _controller.takePicture();
      setState(() {
        isCamera = false;
      });
      //Navigator.pop(context, image);
      print('result: ${image?.path}');
      

    } catch (e) {
      print('22: $e');
    }
  }
  void _retakePicture() {
  setState(() {
    isCamera = true;
    image = null; 
  });
}
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(isCamera) {
      return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var tmp = MediaQuery.of(context).size;
            var screenH = math.max(tmp.height, tmp.width);
            var screenW = math.min(tmp.height, tmp.width);
            tmp = _controller.value.previewSize!;
            var previewH = math.max(tmp.height, tmp.width);
            var previewW = math.min(tmp.height, tmp.width);
            var screenRatio = screenH / screenW;
            var previewRatio = previewH / previewW;
            return Stack(
              children: [
                
                Positioned.fill(
                  child: OverflowBox(
                    maxHeight:
                      screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
                    maxWidth:
                      screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
                    child: CameraPreview(_controller)
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.185,
                    color: const Color.fromRGBO(0, 0, 0, 0.4),
                    child: Center(
                      child: GestureDetector(
                        onTap: _takePicture,
                        child: Container(
                          width: 83.0,
                          height: 83.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white, 
                              width: 4.0, 
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 63.0,
                              height: 63.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              
                            ),
                          ), 
                        ),
                        
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.14,
                    color: const Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
                Positioned(
                  right: 20,
                  left: 20,
                  top: MediaQuery.of(context).size.height*0.25,
                  child: Center(
                    child: Image.asset(
                      'assets/et_focus.png',
                      fit: BoxFit.contain,
                      height: 280,
                      width: 280,
                    ),
                  ),
                ),

              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      
      );
    } else {
      return Stack(
        //mainAxisSize: MainAxisSize.max,
        children: [
          Positioned.fill(
            child: Image.file(
                File(image!.path),
                width: MediaQuery.of(context).size.width, 
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      
                      onPressed: _retakePicture, 
                      child: Text("Chụp lại")
                    ),
                    TextButton(
                      onPressed: _retakePicture, 
                      child: Text("Tiếp tục")
                    ),
                
                  ],
                ),
              ),
            ),
          )
            
          
        ], 
      
    );
    }
  }

}


