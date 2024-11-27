import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/terms_conditions/terms_conditions_model.dart';
import 'package:mad_assignment/services/terms_conditions/terms_conditions_service.dart';

class TermsConditionsController extends GetxController {
  var isLoading = true.obs;
  var termsList = <TermsConditionsModel>[].obs;
  fetchTerms() async {
    try {
      isLoading(true);
      var termsData = await TermsConditionsService().fetchTermsData();
      termsList.addAll(termsData);
    } catch (e) {
      if (kDebugMode) {
        print("error fetching terms data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
