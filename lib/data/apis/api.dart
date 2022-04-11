import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exception.dart';

class API {
  static Future<dynamic> get({required String url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time');
    } catch (e) {
      throw UnAuthorizedException(e.toString());
    }
  }
}
