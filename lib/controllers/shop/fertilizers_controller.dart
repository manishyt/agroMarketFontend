// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/shop/baseproduct_models.dart';
import 'package:mad_assignment/services/shop/fertilizers_service.dart';

class FertilizersController extends GetxController {
  var isLoading = true.obs;
  var fertilizersList = <BaseProductModel>[].obs;
  fetchFertilizers() async {
    try {
      isLoading(true);
      var fertilizersData = await FertilizersService().fetchFertilizersData();
      fertilizersList.addAll(fertilizersData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching base product data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
