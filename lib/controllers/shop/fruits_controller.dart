// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/fruits_service.dart';

class FruitsController extends GetxController {
  var isLoading = true.obs;
  var fruitsList = <BaseProductModel>[].obs;
  fetchFruits() async {
    try {
      isLoading(true);
      var fruitsData = await FruitsService().fetchFruitsData();
      fruitsList.addAll(fruitsData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
