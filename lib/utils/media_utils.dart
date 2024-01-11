import 'dart:async';

import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;


class MediaUtils {
  static final MediaUtils instance = MediaUtils._getInstance();
  MediaUtils._getInstance();

  final _record = AudioRecorder();

  
  Future<void> startRecord()async {
    Completer completer = Completer();
    try {
      if (await _record.hasPermission()) {
        // Start recording to file
        final cacheDir = await path_provider.getTemporaryDirectory();
        const String audioFileName = 'record.m4a';
        final String audioPath = path.join(cacheDir.path, audioFileName);
        await _record.start(const RecordConfig(), path: audioPath);
        
        
      }
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }


  Future stopRecord()async{
    Completer completer = Completer();
    try{
      final path = await _record.stop();

      completer.complete(path);
      
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
  
  Future<void> dispose() async {
    _record.dispose();
  }
}