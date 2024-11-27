import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mad_assignment/models/shop/cart_models.dart';
import 'package:mad_assignment/services/shop/cart_service.dart';

class CartController extends GetxController {
  final CartService cartService = CartService();
  final box = GetStorage();

  Future<void> addCart(
      {required String userId, required String productId}) async {
    final response =
        await cartService.addCart(userId: userId, productId: productId);

    if (response.statusCode == 201) {
      Get.snackbar("Added to Cart Success",
          "You have successfully added the item to cart");
    } else {
      //Registration Failed
      Get.snackbar("Add to Cart Failed", "Please add the item again to cart");
    }
  }
}

class GetCartController extends GetxController {
  var isLoading = true.obs;
  var cartList = <CartModel>[].obs;

  fetchCart() async {
    try {
      isLoading(true);
      var aboutData = await GetCartService().fetchCartData();
      cartList.addAll(aboutData);
      if (kDebugMode) {
        print(cartList);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching product data: $e");
      }
    } finally {
      isLoading(false);
    }
  }
}
