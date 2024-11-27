import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:mad_assignment/models/refund/refund_models.dart';
import 'package:mad_assignment/services/connection.dart';

class RefundService {
  Future<List<RefundModel>> fetchRefundData() async {
    var response = await http.get(
      Uri.parse("${url}api/refund/"),
    );
    if (response.statusCode == 200) {
      return refundModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("network erro");
      }
      throw Exception("nework error");
    }
  }
}
