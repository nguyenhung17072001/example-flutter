import 'dart:convert';
import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:example/utils/index.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;


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
  late AudioPlayer _audioPlayer = AudioPlayer();
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    fetchData();
    
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _audioPlayer.dispose();
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
   
    // ignore: use_build_context_synchronously
    final XFile? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CameraScreen(cameras: cameras)),
    );
    if (result != null) {
      setState(() {
        imageFile = result;
      });
    
   }
  }
  Future<String> _getAudioRecordingPath() async {
    final directory = await path_provider.getApplicationDocumentsDirectory();
    return path.join(directory.path, 'audio_recording.mp3');
  }
  Future<void> _startRecording() async {
    try {
      String filePath = await _getAudioRecordingPath();
    await _audioPlayer.setFilePath(filePath);
    await _audioPlayer.setSpeed(1.0);
    await _audioPlayer.play();
    setState(() {
      _isRecording = true;
      print('Đang ghi âm...');
    });
    } catch (e) {
      print('Lỗi khi bắt đầu ghi âm: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _audioPlayer.stop();
      setState(() {
        _isRecording = false;
        print('Kết thúc ghi âm');
      });
    } catch (e) {
      print('Lỗi khi kết thúc ghi âm: $e');
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
                              width: 60, 
                              height: 60,
                              fit: BoxFit.cover,
                            )
                          : const SizedBox(),
                        )
                      ],
                    )


                  ]
                ),
              )
            ),

            Center(
              child: GestureDetector(
                onLongPressStart: (_) {
                  _startRecording();
                },
                onLongPressEnd: (_) {
                  _stopRecording();
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: _isRecording ? Colors.red : Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    _isRecording ? 'Đang ghi âm...' : 'Ấn giữ để ghi âm',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
        
            )

          ],
          
          
        ),
      ),
    );
  }
}
