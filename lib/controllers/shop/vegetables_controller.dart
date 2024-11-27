// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/vegetables_service.dart';

class VegetablesController extends GetxController {
  var isLoading = true.obs;
  var vegetablesList = <BaseProductModel>[].obs;
  fetchVegetables() async {
    try {
      isLoading(true);
      var vegetablesData = await VegetablesService().fetchVegetablesData();
      vegetablesList.addAll(vegetablesData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
