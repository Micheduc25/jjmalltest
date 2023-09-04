import 'package:dio/dio.dart';

class AuthProvider {
  final dio = Dio();

  final String baseUrl = 'https://stagingapi.chipchip.social/v1';

  Future<String> loginUser(String email, String password) async {
    try {
      var dio = Dio();

      final res = await dio.post('$baseUrl/users/login',
          data: {'phone': email, 'password': password, 'country': "ETH"});

      print(res.data["data"]["token"]);
      return res.data["data"]["token"] as String;
    } on DioException catch (e) {
      // Handle DioException here
      print(e.response?.data["error"]["message"]);
      throw Exception(e.response?.data["error"]["message"]);
    } on Exception {
      throw Exception("An unexpected error occurred.");
    }
  }

  Future<Map<String, dynamic>> getUserData(String token) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer $token'};

      final res = await dio.get('$baseUrl/users');

      return res.data["data"] as Map<String, dynamic>;
    } on DioException catch (e) {
      // Handle DioError here
      print(e.response?.data["error"]["message"]);
      throw Exception(e.response?.data["error"]["message"]);
    } on Exception {
      throw Exception("An unexpected error occurred.");
    }
  }
}
