import 'package:get/get.dart';
import 'package:mad_assignment/views/account.dart';
import 'package:mad_assignment/views/cart.dart';
import 'package:mad_assignment/views/checkout.dart';
import 'package:mad_assignment/views/home.dart';
import 'package:mad_assignment/views/about.dart';
import 'package:mad_assignment/views/enquiry.dart';
import 'package:mad_assignment/views/myorders.dart';
import 'package:mad_assignment/views/refund.dart';
import 'package:mad_assignment/views/shop.dart';
import 'package:mad_assignment/views/terms_conditions.dart';
import 'package:mad_assignment/views/register.dart';
import 'package:mad_assignment/views/login.dart';
import 'package:mad_assignment/views/whitelist.dart';

class Routes {
  static final route = [
    GetPage(name: '/register', page: () => Register()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/about', page: () => AboutUs()),
    GetPage(name: '/enquiry', page: () => Enquiry()),
    GetPage(name: '/refund', page: () => RefundPolicy()),
    GetPage(name: '/terms', page: () => TermsConditions()),
    GetPage(name: '/shop', page: () => Shop()),
    GetPage(name: '/account', page: () => Account()),
    GetPage(name: '/order', page: () => Orders()),
    GetPage(name: '/checkout', page: () => checkOut()),
    GetPage(name: '/cart', page: () => Cart()),
    GetPage(name: '/whitelist', page: () => Whitelist()),
  ];
}
