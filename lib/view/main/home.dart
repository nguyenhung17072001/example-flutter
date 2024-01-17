import 'dart:io';

import 'package:camera/camera.dart';
import 'package:example/common/index.dart';
import 'package:example/utils/index.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';

import '../../common/modal_sheet/modal_sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //timekeeping camera 
  
  XFile? imageFile;
  List<CameraDescription> cameras = [];

  //partner camera
  List<XFile> imageFiles = [];





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(imageFiles);
  }

  void testLocalAuth () async{
    final result = await BiometricUtils.instance.getBiometrics();
    print("result: $result");
  }

  Future<void> _getTimekeepingCamera() async {
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


  Future<void> _getPartnerCamera() async {
    cameras = await availableCameras();
   
    // ignore: use_build_context_synchronously
    final List<XFile>? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PartnerCamera(cameras: cameras)),
    );
    print(result);
    if (result != null && result.isNotEmpty) {
      setState(() {
        imageFiles = result;
      });
    
    }
  }

  void _showFailModal() async {
    showModalBottomSheet(
      showDragHandle: true,
      useSafeArea: true,
      isDismissible: true,
      context: context, 
      builder: (BuildContext context) {
        return const TimekeepingFailModal();
      }
    );
  }

  void _showSuccessModal() async {
    showModalBottomSheet(
      showDragHandle: true,
      useSafeArea: true,
      isDismissible: true,
      context: context, 
      builder: (BuildContext context) {
        return TimekeepingSuccessModal(
          timekeepingStatus: 'Checkin Thành Công',
          fullName: "Nguyễn Hưng",
          role: "Trình dược viên"
        );
      }
    );
  }

  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: testLocalAuth,
              child: Text('Test Sinh trắc học'),
            ),
            Column(
              children: [
                
                TextButton(
                  onPressed: _getTimekeepingCamera,
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

            TextButton(
              onPressed: _getPartnerCamera,
              child: const Text('Camera đối tác theo tuyến'),
            ),
            TextButton(
              onPressed: _showFailModal,
              child: const Text('modal điểm danh thất bại '),
            ),
            TextButton(
              onPressed: _showSuccessModal,
              child: const Text('modal điểm danh thành công '),
            ),

          ],
        )
      ),
    );
  }
}