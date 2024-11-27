import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../connection.dart';

class EnquiryService {
  Future<http.Response> enquiryUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String message}) async {
    try {
      final response = await http.post(Uri.parse("${url}api/enquiry/"), body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'message': message
      });
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("error on newtork");
      }
      rethrow;
    }
  }
}
