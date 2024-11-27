import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/about/about_models.dart';
import 'package:mad_assignment/services/about/about_service.dart';

class AboutController extends GetxController {
  var isLoading = true.obs;
  var aboutList = <AboutModel>[].obs;

  fetchAbout() async {
    try {
      isLoading(true);
      var aboutData = await AboutService().fetchAboutData();
      aboutList.addAll(aboutData);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching product data: $e");
      }
    } finally {
      isLoading(false);
    }
  }
}
