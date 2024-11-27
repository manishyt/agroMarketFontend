import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

void saveLoggedIn(namedRoute, token, email) {
  if (token != null) {
    // Save token to GetStorage
    box.write('token', token);
    box.write('email', email);

    // Use offAndToNamed for navigation after showing the Snackbar
    Get.offAndToNamed(namedRoute);
  }
}

void checkLoggedIn(namedRoute) {
  // Check if the token exists on app launch
  final token = box.read('token');
  if (token != null) {
    Get.offNamed(
        namedRoute); // Redirect to home screen or authenticated section
  }
}

void logout(namedRoute) {
  // Remove the token on logout
  box.remove('token');
  Get.offNamed(namedRoute); // Redirect to the login screen
}

class SessionController extends GetxController {
  RxBool isLoggedIn = false.obs;

  void setSession(bool value) {
    isLoggedIn.value = value;
  }
}
