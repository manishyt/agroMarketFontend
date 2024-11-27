import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mad_assignment/controllers/user/user_login_preference.dart';
import 'package:mad_assignment/routes.dart';

void main() {
  GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Shopingo());
}

class Shopingo extends StatelessWidget {
  Shopingo({Key? key}) : super(key: key);
  final SessionController sessionController = Get.put(SessionController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/register',
      defaultTransition: Transition.zoom,
      transitionDuration: const Duration(seconds: 1),
      getPages: Routes.route,
      debugShowCheckedModeBanner: false,
      title: 'Shopingo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
