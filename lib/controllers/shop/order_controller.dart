import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/order_models.dart';
import 'package:mad_assignment/services/shop/order_service.dart';

class OrderController extends GetxController {
  OrderService orderService = OrderService();
  var isLoading = true.obs;
  var orderList = <OrderModel>[].obs;

  fetchOrder() async {
    try {
      isLoading(true);
      var orderData = await orderService.fetchOrderData();
      orderList.addAll(orderData);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching product data: $e");
      }
    } finally {
      isLoading(false);
      if (kDebugMode) {
        print(orderList);
      }
    }
  }
}
