import 'package:flutter/foundation.dart';

import 'package:mad_assignment/models/about/about_models.dart';

import 'package:http/http.dart' as http;
import 'package:mad_assignment/services/connection.dart';

class AboutService {
  Future<List<AboutModel>> fetchAboutData() async {
    var response = await http.get(
      Uri.parse(
        "${url}api/about/",
      ),
    );
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      return aboutModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("newtwork error");
      }
      throw Exception("network error");
    }
  }
}
