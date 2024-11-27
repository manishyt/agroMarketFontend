import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/models/shop/order_models.dart';
import 'package:mad_assignment/services/connection.dart';

class OrderService {
  Future<List<OrderModel>> fetchOrderData() async {
    var box = GetStorage();
    var id = box.read('id');
    var response = await http.get(
      Uri.parse(
        "${url}api/shop/checkout/?id=$id",
      ),
    );
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      return orderModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("newtwork error");
      }
      throw Exception("network error");
    }
  }
}
