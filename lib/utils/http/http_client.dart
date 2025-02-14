import 'dart:convert';

import 'package:http/http.dart' as http;

class EHttpHelper {
  static const String _baseUrl = 'https://restcountries.com/v3.1/all';

  static Future<List<dynamic>> get() async {
    print('Fetching data from $_baseUrl');
    final response = await http.get(Uri.parse(_baseUrl));
    print('Response status: ${response.statusCode}');
    return _handleResponse(response);
  }

  static List<dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        print('API response is empty');
        throw Exception('API response is empty');
      }

      try {
        var decoded = json.decode(response.body);
        if (decoded is List) {
          return decoded;
        } else {
          throw Exception('Unexpected API response format');
        }
      } catch (e) {
        throw Exception('Failed to parse country data: $e');
      }
    } else {
      throw Exception('Failed to load Data: ${response.statusCode}');
    }
  }
}
