// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/dairyProducts_service.dart';

class DairyproductsController extends GetxController {
  var isLoading = true.obs;
  var dairyProductsList = <BaseProductModel>[].obs;
  fetchDairyProducts() async {
    try {
      isLoading(true);
      var dairyProductsData =
          await DairyProductsService().fetchDairyProductsData();
      dairyProductsList.addAll(dairyProductsData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
