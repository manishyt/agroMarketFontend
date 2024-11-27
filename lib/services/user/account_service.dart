import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mad_assignment/models/user/account_model.dart';
import 'package:mad_assignment/services/connection.dart';

class AccountService {
  Future<AccountModel> fetchAccountData() async {
    var box = GetStorage();

    String email = box.read('email');
    if (kDebugMode) {
      print(Uri.parse("${url}api/register/$email/"));
    }

    var response = await http.get(
      Uri.parse("${url}api/register/$email/"),
    );
    if (response.statusCode == 200) {
      return accountModelFromJson(response.body);
    } else {
      if (kDebugMode) {
        print("network erro");
      }

      throw Exception("nework error");
    }
  }
}
