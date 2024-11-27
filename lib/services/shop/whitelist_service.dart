import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/models/shop/whitelist_models.dart';
import 'package:mad_assignment/services/connection.dart';

class WhitelistService {
  Future<http.Response> addWhitelist(
      {required String userId, required String productId}) async {
    try {
      // Modify the URL according to your API endpoint
      final Uri apiUrl = Uri.parse("${url}api/shop/whitelist/");

      final response =
          await http.post(apiUrl, body: {'user': userId, 'product': productId}

              // Replace with your request body
              );

      return response;
    } catch (e) {
      if (kDebugMode) {
        print("Error during add to whitelist : $e");
      }
      rethrow;
    }
  }
}

class GetWhitelistService {
  Future<List<WhitelistModel>> fetchWhitelistData() async {
    var box = GetStorage();
    var id = box.read('id');

    var response = await http.get(
      Uri.parse(
        "${url}api/shop/whitelist/?id=$id",
      ),
    );
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      return whitelistModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("newtwork error");
      }
      throw Exception("network error");
    }
  }
}
