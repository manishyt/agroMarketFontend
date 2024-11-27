import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/services/connection.dart';

class RegisterService {
  Future<http.Response> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String country,
    required String city,
    required String passsword,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${url}api/register/"),
        body: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone_number': phoneNumber,
          'country': country,
          'city': city,
          'password': passsword,
          'password2': passsword
        },
      );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print("error during registration:$e");
      }
      rethrow;
    }
  }
}

// class UpdateRegisterService {
//   Future<http.Response> updateUser({
//     String? firstName,
//     String? lastName,
//     String? email,
//     String? phoneNumber,
//     String? country,
//     String? city,
//     String? passsword,
//   }) async {
//     try {
//       final response = await http.patch(
//         Uri.parse("$url api/register/"),
//         body: {
//           'first_name': firstName,
//           'last_name': lastName,
//           'email': email,
//           'phone_number': phoneNumber,
//           'country': country,
//           'city': city,
//           'password': passsword,
//           'password2': passsword
//         },
//       );
//       return response;
//     } catch (e) {
//       if (kDebugMode) {
//         print("error during registration:$e");
//       }
//       rethrow;
//     }
//   }
// }
