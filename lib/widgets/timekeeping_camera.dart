import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

      final image = await _controller.takePicture();
      Navigator.pop(context, image);
      print('result: ${image.path}');
      // Do something with the captured image, for example, save it to gallery
      // Replace this with your desired code to handle the captured image

    } catch (e) {
      print('22: $e'); // Handle the exception appropriately
    }
  }
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder<void>(
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
                
                  
                OverflowBox(
                  maxHeight:
                    screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
                  maxWidth:
                    screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
                  child: CameraPreview(_controller)
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    backgroundColor: Colors.grey.withOpacity(0.3), // Set the transparency here
                    child: Icon(Icons.camera),
                    onPressed: _takePicture,
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

}


