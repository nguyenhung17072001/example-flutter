import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class APIService {
  static Map<String, String> _getHeaders() {
    const storage = FlutterSecureStorage();
    final token = storage.read(key: 'token');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  static Future<dynamic> get(String baseURL, {Map<String, dynamic>? params}) async {
    final Uri uri = Uri.parse(baseURL).replace(queryParameters: params);
    final response = await http.get(uri, headers: _getHeaders());
    return _handleResponse(response);
  }

  static Future<dynamic> post(String baseURL, {dynamic body}) async {
    final Uri uri = Uri.parse(baseURL);
    final response = await http.post(uri, headers: _getHeaders(), body: jsonEncode(body));
    return _handleResponse(response);
  }

  // Add other methods like put, delete, etc.

  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      return 'Failed to load data. Status code: ${response.statusCode}';
    } 
  }
}
