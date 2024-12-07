import 'package:dio/dio.dart';

class ApiService {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/';

  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get(String endPoint) async {
    final Response response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
