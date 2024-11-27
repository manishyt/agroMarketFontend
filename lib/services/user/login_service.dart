import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../connection.dart';

class LoginService {
  Future<http.Response> loginUser(
      {required String email, required String password}) async {
    try {
      final response = await http.post(Uri.parse("${url}api/login/"),
          body: {'email': email, 'password': password});
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("error during login:$e");
      }
      rethrow;
    }
  }
}
