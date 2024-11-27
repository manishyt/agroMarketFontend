import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/models/shop/cart_models.dart';
import 'package:mad_assignment/services/connection.dart';

class CartService {
  Future<http.Response> addCart(
      {required String userId, required String productId}) async {
    try {
      // Modify the URL according to your API endpoint
      final Uri apiUrl = Uri.parse("${url}api/shop/cart/");

      final response =
          await http.post(apiUrl, body: {'user': userId, 'product': productId}

              // Replace with your request body
              );

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("Error during registration: $e");
      }
      rethrow;
    }
  }
}

class GetCartService {
  Future<List<CartModel>> fetchCartData() async {
    var box = GetStorage();
    var id = box.read('id');

    var response = await http.get(
      Uri.parse(
        "${url}api/shop/cart/?id=$id",
      ),
    );
    if (kDebugMode) {
      print(response.statusCode);
      print(Uri.parse(
        "${url}api/shop/cart/?pk=$id",
      ));
    }
    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("newtwork error");
      }
      throw Exception("network error");
    }
  }
}
