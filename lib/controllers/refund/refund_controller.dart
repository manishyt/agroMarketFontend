import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/models/refund/refund_models.dart';
import 'package:mad_assignment/services/refund/refund_service.dart';

class RefundController extends GetxController {
  var isLoading = true.obs;
  var refundList = <RefundModel>[].obs;
  fetchRefund() async {
    try {
      isLoading(true);
      var refundData = await RefundService().fetchRefundData();
      refundList.addAll(refundData); // Use addAll instead of add
    } catch (e) {
      if (kDebugMode) {
        print("error fetching refund data:$e");
      }
    } finally {
      isLoading(false);
    }
  }
}
