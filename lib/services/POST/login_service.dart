// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService {
  final String baseUrl = 'https://mediadwi.com/api/latihan';

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl/login'));

      request.fields['username'] = username;
      request.fields['password'] = password;

      request.headers.addAll({
        'Accept': '/',
        'Content-Type': 'multipart/form-data',
      });

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      return json.decode(response.body);
    } catch (e) {
      print('Exception: $e');
      return {
        'status': false,
        'message':
            'An error occurred while registering. Please try again later.',
      };
    }
  }
}
