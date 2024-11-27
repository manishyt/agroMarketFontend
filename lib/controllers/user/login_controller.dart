import 'dart:convert';

import 'package:get/get.dart';
import 'package:mad_assignment/controllers/user/user_login_preference.dart';
// import 'package:mad_assignment/models/user_model.dart';
import 'package:mad_assignment/services/user/login_service.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final LoginService _loginService = LoginService();
  final box = GetStorage();
  final SessionController sessionController = Get.find();

  @override
  void onInit() {
    super.onInit();
    checkLoggedIn(
        '/home'); // Check if the user is already logged in on app launch
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response =
          await _loginService.loginUser(email: email, password: password);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final token = data['token'];
        final message = data['msg'];

        if (token != null) {
          // Save token to GetStorage
          saveLoggedIn('/home', token, email);
          Get.snackbar(
              "Login Success", message ?? "You have logged in successfully");
          sessionController.setSession(true);
        } else {
          Get.snackbar("Login Failed", "Token not received");
        }
      } else {
        Get.defaultDialog(
          title: "Login Failed",
          textConfirm: "SignUp",
          onConfirm: () {
            Get.toNamed('/register');
          },
          textCancel: "Cancel",
          onCancel: () {
            Get.toNamed('/login');
          },
        );
      }
    } catch (e) {
      Get.snackbar("Login Failed", "An error occurred during login: $e");
    }
  }
}
