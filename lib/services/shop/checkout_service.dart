import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/services/connection.dart';

class CheckoutService {
  Future<http.Response> checkoutUser({
    required String user,
    required String product,
    required String firstName,
    required String lastName,
    required String email,
    required String country,
    required String city,
    required String address,
    required String phoneNumber,
    required String orderNote,
    required String paymentMethod,
    required String totalBill,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("${url}api/shop/checkout/"),
        body: {
          'user': user,
          'product': product,
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'country': country,
          'city': city,
          'address': address,
          'mobile_number': phoneNumber,
          'order_note': orderNote,
          'payment_method': paymentMethod,
          'total_bill': totalBill
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
