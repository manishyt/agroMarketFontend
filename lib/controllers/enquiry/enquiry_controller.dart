import 'package:get/get.dart';
import 'package:mad_assignment/services/enquiry/enquiry_service.dart';

class EnquiryController extends GetxController {
  final EnquiryService enquiryService = EnquiryService();
  Future<void> enquiryUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String message}) async {
    final response = await enquiryService.enquiryUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        message: message);
    if (response.statusCode == 201) {
      Get.snackbar("Enquiry Sucessful",
          "Thank you for your enquiry. We will contact you soon");
      Get.toNamed('/shop');
    } else {
      Get.snackbar("Enquiry Failed",
          "Something went Wrong . Please resubmit the enquiry");
    }
  }
}
