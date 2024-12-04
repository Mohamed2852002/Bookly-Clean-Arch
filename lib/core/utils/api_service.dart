import 'package:dio/dio.dart';

class ApiService {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/';

  static final Dio _dio = Dio();

  static Future<Map<String, dynamic>> get(
      String endPoint) async {
      final Response response = await _dio.get('$_baseUrl$endPoint');
      return response.data;
  }
}
