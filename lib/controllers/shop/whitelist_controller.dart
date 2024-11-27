import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/whitelist_models.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mad_assignment/services/cart_service.dart';
import 'package:mad_assignment/services/shop/whitelist_service.dart';

class WhitelistController extends GetxController {
  final WhitelistService whitelistService = WhitelistService();

  Future<void> addWhitelist(
      {required String userId, required String productId}) async {
    final response = await whitelistService.addWhitelist(
        userId: userId, productId: productId);

    if (response.statusCode == 201) {
      Get.snackbar("Added to Favourite Success",
          "You have successfully added the item to favourite");
    } else {
      //Registration Failed
      Get.snackbar(
          "Add to Favourite Failed", "Please add the item again to favourite");
    }
  }
}

class GetWhitelistController extends GetxController {
  var isLoading = true.obs;
  var whiteList = <WhitelistModel>[].obs;

  fetchWhitelist() async {
    try {
      isLoading(true);
      var aboutData = await GetWhitelistService().fetchWhitelistData();
      whiteList.addAll(aboutData);
      if (kDebugMode) {
        print(whiteList);
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
