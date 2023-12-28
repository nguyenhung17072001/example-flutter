import 'package:example/api/url.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'dart:convert' as convert;


class DioClient {


  Future getAPI(String unencodedPath, Map<String, dynamic>? parameters) async {
    var url =
      Uri.http(UrlConfig.rootUrl, unencodedPath, parameters);
  
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
        print(jsonResponse);
        return jsonResponse;
        //var itemCount = jsonResponse['totalItems'];
        //print('Number of books about http: $itemCount.');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    
    } catch(err) {
      print('err: ${err}');
    }
  }

  Future postAPI(String unencodedPath, Object body) async {
    var url =
      Uri.http(UrlConfig.rootUrl, unencodedPath);
  
    try {
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
        print(jsonResponse);
        return jsonResponse;
        //var itemCount = jsonResponse['totalItems'];
        //print('Number of books about http: $itemCount.');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    
    } catch(err) {
      print('err: ${err}');
    }
  }

}