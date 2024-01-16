import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:image/image.dart' as img;
class PartnerCamera extends StatefulWidget {
  final List<CameraDescription> cameras;

  const PartnerCamera({super.key, required this.cameras});
  @override
  _PartnerCameraState createState() => _PartnerCameraState();
}

class _PartnerCameraState extends State<PartnerCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<XFile> images = [];
  XFile? image;
  bool isCamera = true;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.veryHigh);
    _initializeControllerFuture = _controller.initialize();

  }

  //handle:
  void _takePicture() async {
    try {
      // Ensure the controller is initialized before taking a picture
      await _initializeControllerFuture;
      image = await _controller.takePicture();

      setState(() {
        isCamera = false;
      });

      //print('result: ${image?.path}');
    } catch (e) {
      print('error while taking the picture: $e');
    }
  }

  void _submitImages()async {
    images.add(image!);
    Navigator.pop(context, images);
  }

  void _takePictureAgain()async{
    images.add(image!);
    setState(() {
      isCamera = true;
      image = null; 
    });
  }

  void _retakePicture() {
    setState(() {
      isCamera = true;
      image = null; 
    });
  }
  


  //dispose
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
                              width: 68.0,
                              height: 68.0,
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
                  left: 10,
                  top: MediaQuery.of(context).size.height*0.07,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.chevron_left, size: 28, color: Colors.white,),
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
                fit: BoxFit.cover,
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
                      child: const Text(
                        "Chụp lại",
                        style: TextStyle(
                          color: Color(0xffFF5E00),
                          fontSize: 14,
                        ),
                      )
                    ),
                    TextButton(
                      
                      onPressed: _takePictureAgain, 
                      child: const Text(
                        "Chụp tiếp",
                        style: TextStyle(
                          color: Color(0xffFF5E00),
                          fontSize: 14,
                        ),
                      )
                    ),
                    TextButton(
                      
                      onPressed: _submitImages, 
                      child: const Text(
                        "Tiếp tục",
                        style: TextStyle(
                          color: Color(0xffFF5E00),
                          fontSize: 14,
                        ),
                      )
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


