import "package:dio/dio.dart";
import 'dart:async';

import 'http.config.dart';


class HttpUtil {
  String rootUrl = 'http://192.168.1.102:4000';
  final dio = Dio();
  
  Future post(String path, Object? data) async {
    try {
      final response = await dio.post('$rootUrl$path' , data: data);
      print(response);
      return response.data;
    } catch (e) {
      print('err: $e');
    }
  }
  
}