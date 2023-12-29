import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:dio/dio.dart";
import 'dart:async';

import 'http.config.dart';

class HttpUtil {
  String rootUrl = '10.0.2.2:4000';
  

  Future post(String path, Object? data) async {
    var client = http.Client();
    final url = Uri.https(rootUrl, path);
    try {
      var response = await http.post(
          url,
          body: {
            'username': 'df',
        'password': 'sf',
          });
      print(response.body);
      return response.body;
      
    } catch(e) {
      print(e);
      client.close();
    }
  }
}
