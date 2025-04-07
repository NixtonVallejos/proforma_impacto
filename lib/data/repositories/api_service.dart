import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = "https://gruponixton.net/api";
  final Dio _dio = Dio();

  Future<String?> login(String username, String password) async {
    try {
      final response = await _dio.post(
        "$baseUrl/login",
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        return response.data['access_token'];
      }
    } catch (e) {
      return "Error during login: $e";
    }
    return null;
  }
}
