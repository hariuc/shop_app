import 'dart:convert';
import 'dart:io';

import 'package:shop_app/services/constants.dart';
import 'package:http/http.dart' as http;

class Utils {
  static Map<String, String> getHeaders() => {
        HttpHeaders.acceptCharsetHeader: 'application/json;utf-8',
        HttpHeaders.acceptEncodingHeader: 'utf-8',
      };

  static Future<Map<String, dynamic>> getDataFromServer(
      {required String uriPath}) async {
    final response = await http.get(Uri.parse(Constants.serverPath + uriPath),
        headers: getHeaders());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Exception');
    }
  }
}
