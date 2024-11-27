import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mad_assignment/models/user/account_model.dart';
import 'package:mad_assignment/services/user/account_service.dart';

class AccountController extends GetxController {
  var isLoading = true.obs;
  var accountList = <AccountModel>[].obs;
  var box = GetStorage();

  fetchAccount() async {
    try {
      isLoading(true);
      var account = await AccountService().fetchAccountData();
      accountList.add(account);
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching account data: $e");
        print(accountList);
      }
    } finally {
      isLoading(false);
      box.write('id', accountList[0].id.toString());
    }
  }
}
