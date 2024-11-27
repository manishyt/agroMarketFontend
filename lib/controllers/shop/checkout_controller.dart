import 'package:get/get.dart';

import 'package:mad_assignment/services/shop/checkout_service.dart';

class CheckoutController extends GetxController {
  final CheckoutService checkoutService = CheckoutService();

  Future<void> checkoutUser(
      {required String user,
      required String product,
      required String firstName,
      required String lastName,
      required String email,
      required String country,
      required String city,
      required String address,
      required String phoneNumber,
      required String orderNote,
      required String paymentMethod,
      required String totalBill}) async {
    final response = await checkoutService.checkoutUser(
        user: user,
        product: product,
        firstName: firstName,
        lastName: lastName,
        email: email,
        country: country,
        city: city,
        address: address,
        phoneNumber: phoneNumber,
        orderNote: orderNote,
        paymentMethod: paymentMethod,
        totalBill: totalBill);

    if (response.statusCode == 201) {
      Get.snackbar("Checkout Success", "You have successfully checkout ");
      Get.toNamed('/order');
    } else {
      //Registration Failed
      Get.snackbar("checkout failed", "Please fill all the  fields");
    }
  }
}
