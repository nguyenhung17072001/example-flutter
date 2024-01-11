import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';
import 'package:example/utils/index.dart';
import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:record/record.dart';

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
  late String _audioPath ='';
  final AudioRecorder record = AudioRecorder();
  
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
    record.dispose();
  }

  void fetchData() async {
    final String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final uid = await storage.read(key: 'uid');
    final data = await FirebaseUtils.instance.readData("timekeeping/$uid/$date");

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

  void _startRecord()async {
    try {
      if (await record.hasPermission()) {
        // Start recording to file
        final cacheDir = await path_provider.getTemporaryDirectory();
        const String audioFileName = 'record.m4a';
        _audioPath = path.join(cacheDir.path, audioFileName);
        await record.start(const RecordConfig(), path: _audioPath);
        
        setState(() {
          _isRecording = true;
        });
      }
    } catch (e) {
      print("lỗi khi bắt đầu ghi âm: $e");
    }
  }

  void _stopReord()async {
    try{
      final path = await record.stop();

      print('xxxx: $path');
      setState(() {
        _isRecording = false;
        _audioPlayer.setFilePath(path.toString());
      });
    } catch (e) {
      print("lỗi khi kết thúc ghi âm: $e");
    }
    
  }
  void _playRecordedAudio() async {
    try {
      await _audioPlayer.play();
      
    } catch (e) {
      print("Error playing recorded audio: $e");
    }
  }


  void _uploadImage()async {
    Fluttertoast.showToast(
      msg: "Đã lưu thành công",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
    );
    try{
      String name = DateTime.timestamp().toUtc().toString();
      File file = File(imageFile!.path);
      await FirebaseUtils.instance.uploadFileStorage("test/images/$name.jpg", file);
      
    }catch(e){
      print('sss: $e');
    }
  }
  void _uploadRecord()async {
    Fluttertoast.showToast(
      msg: "Đã lưu thành công",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
    );
    try{
      String name = DateTime.timestamp().toUtc().toString();
      File file = File(_audioPath);
      await FirebaseUtils.instance.uploadFileStorage("test/records/$name.m4a", file);
      
    }catch(e){
      print(e);
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
                onPressed: () {},
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
              child: Text('Media:'),
            ),

            MediaButton(
              onPressed: _uploadImage, 
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
              child: Container(
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  onLongPress: () {
                    _startRecord();
                    setState(() {
                      _isRecording = true;
                    });
                  },
                  onLongPressUp: () {
                    _stopReord();
                    setState(() {
                      _isRecording = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: _isRecording ? Colors.red : Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      _isRecording ? Icons.stop : Icons.mic,
                      color: Colors.white,
                      size: 50.0, // Adjust the size as needed
                    ),
                  ),
                ),
              ),
            ),
            if(_isRecording)
            Center(
              child: Text('Đang ghi âm'),
            ) else 
            SizedBox(),
            
            if (_audioPath != null && _audioPath!.isNotEmpty)
              MediaButton(
                onPressed: _uploadRecord,
                child: Container(
                  child: Text('record.mp3'),
                ),
              )
            else
              Text(''),
            TextButton(
              onPressed: _playRecordedAudio,
              child: Text('Play Recorded Audio'),
            ),

            


          ],
          
          
          
        ),
      ),
    );
  }
}
