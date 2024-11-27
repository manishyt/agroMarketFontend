// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/baseproduct_service.dart';

class BaseProductController extends GetxController {
  var isLoading = true.obs;
  var baseProductList = <BaseProductModel>[].obs;
  fetchBaseProduct() async {
    try {
      isLoading(true);
      var baseProductData = await BaseProductService().fetchBaseProductData();
      baseProductList.addAll(baseProductData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
        print(baseProductList);
      }
    } finally {
      isLoading(false);
    }
  }
}
