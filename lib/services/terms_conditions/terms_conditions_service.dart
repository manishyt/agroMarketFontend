import 'package:flutter/foundation.dart';
import 'package:mad_assignment/models/terms_conditions/terms_conditions_model.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/services/connection.dart';

class TermsConditionsService {
  Future<List<TermsConditionsModel>> fetchTermsData() async {
    var response = await http.get(
      Uri.parse("${url}api/terms/"),
    );
    if (response.statusCode == 200) {
      return termsConditionsModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("network error");
      }
      throw Exception("network error");
    }
  }
}
