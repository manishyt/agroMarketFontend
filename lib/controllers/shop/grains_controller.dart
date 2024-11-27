// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/grains_service.dart';

class GrainsController extends GetxController {
  var isLoading = true.obs;
  var grainsList = <BaseProductModel>[].obs;
  fetchGrains() async {
    try {
      isLoading(true);
      var grainsData = await GrainsService().fetchGrainsData();
      grainsList.addAll(grainsData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
