import 'dart:convert';
import 'dart:io';

import 'package:example/utils/index.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:camera/camera.dart';
List<CameraDescription> cameras = [];


class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  final storage = const FlutterSecureStorage();
  Map<String, dynamic>? _timekeepingData;
  XFile? imageFile;


  @override
  void initState() {
    super.initState();
    fetchData();
    
  }

  void fetchData() async {
    final String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final uid = await storage.read(key: 'uid');
    final data = await Firebase_Utils.instance.readData("timekeeping/$uid/$date");

    if (data != null && data is Map) {
      if(mounted) {
        setState(() {
          _timekeepingData = Map<String, dynamic>.from(data);
        });
      }
    }
  }

  Future<void> _getCamera() async {
    cameras = await availableCameras();
   
    final XFile? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraScreen(cameras: cameras)),
    );
    if (result != null) {
    setState(() {
      imageFile = result;
    });
    // Do something with the returned image (imageFile)
  }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
        actions: [],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
              child: Text('Thông tin check in:'),
            ),
            if (_timekeepingData != null && _timekeepingData!.isNotEmpty)
              Log_Button(
                onPressed: _getCamera,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ngày ${DateFormat('dd-MM-yyyy').format(DateTime.now())}'),
                      Text('Check in'),
                      // Access data from _timekeepingData safely, e.g.,:
                      Text("vào ${_timekeepingData?['checkin']?['createAt']}")
                    ],
                  ),
                ),
              )
            else
              Text(''),

            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
              child: Text('Quản lý file:'),
            ),

            MediaButton(
              onPressed: () {}, 
              child: Container(
                child: Column(
                  children: [
                    const Text('Chọn ảnh'),
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: _getCamera, 
                          icon: const Icon(Icons.camera_alt), 
                          label: Container()
                        ),
                        Container(
                          child: imageFile != null
      ? Image.file(
          File(imageFile!.path),
          width: 100, // Đặt kích thước ảnh tùy ý
          height: 100,
          fit: BoxFit.cover, // Có thể thay đổi cách ảnh được hiển thị
        )
      : SizedBox(), // Nếu không có ảnh, hiển thị một SizedBox
                        )
                      ],
                    )


                  ]
                ),
              )
            )

          ],
          
          
        ),
      ),
    );
  }
}
