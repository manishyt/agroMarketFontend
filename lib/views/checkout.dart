import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mad_assignment/controllers/user/account_controller.dart';
import 'package:mad_assignment/controllers/shop/checkout_controller.dart';

// ignore: must_be_immutable, camel_case_types
class checkOut extends StatelessWidget {
  AccountController accountController = AccountController();
  CheckoutController checkoutController = CheckoutController();
  TextEditingController firtNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController orderNoteController = TextEditingController();
  TextEditingController paymentMethodController = TextEditingController();

  checkOut({super.key});

  @override
  Widget build(BuildContext context) {
    final String? productId = Get.parameters['product_id'];
    String? productPrice = Get.parameters['product_price'];
    double price = double.tryParse(productPrice ?? '') ?? 0;
    double delivery = 100;
    double vat = 0.13 * price;
    double totalPrice = price + delivery + vat;

    return Scaffold(
        backgroundColor: const Color.fromARGB(
            255, 214, 235, 252), // Fixed color instantiation
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Text("Shopingo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed('/account');
                      },
                      icon: const Icon(Icons.account_box_rounded)),
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/whitelist');
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/cart');
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              )
            ],
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Info & Links",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Get.toNamed('/refund');
                          },
                          icon: const Icon(Icons.policy_outlined),
                          label: const Text(
                            "Refund",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Get.toNamed('/terms');
                          },
                          icon: const Icon(Icons.run_circle_sharp),
                          label: const Text(
                            "Terms",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Add functionality for "My Orders"
                            Get.toNamed('/order');
                          },
                          icon: const Icon(Icons.shopping_basket),
                          label: const Text(
                            "My Orders",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Add functionality for "Check Out"
                          },
                          icon:
                              const Icon(Icons.shopping_cart_checkout_outlined),
                          label: const Text(
                            "Check Out",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ];
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: FutureBuilder(
            future: accountController.fetchAccount(),
            builder: (context, snapshot) => ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 200, 245, 245),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png',
                        bundle: PlatformAssetBundle()),
                  ), // Fixed CircleAvatar widget
                ),
                ListTile(
                  title: Text(
                      "${accountController.accountList[0].firstName.toUpperCase()} ${accountController.accountList[0].lastName.toUpperCase()}"),
                  leading: const Icon(Icons.person),
                ),
                ListTile(
                  title:
                      Text(accountController.accountList[0].email.toString()),
                  leading: const Icon(Icons.mail),
                ),
                const Divider(
                  height: 0.2,
                ),
                ListTile(
                  title: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/home');
                          },
                          child: const Text(
                            "Home",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  leading: const Icon(Icons.home),
                ),
                ListTile(
                  title: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/shop');
                          },
                          child: const Text(
                            "Shop",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  leading: const Icon(Icons.shop_2_rounded),
                ),
                ListTile(
                  title: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/about');
                          },
                          child: const Text(
                            "About",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  leading: const Icon(Icons.contact_support_sharp),
                ),
                ListTile(
                  title: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/enquiry');
                          },
                          child: const Text(
                            "Contact",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                  leading: const Icon(Icons.contact_emergency),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(255, 4, 185, 98),
              child: const Text(
                "Product Billing Details",
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.blueGrey),
                child: const Text(
                  "Shipping Details",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: firtNameController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "First Name",
                    hintText: "john",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: lastNameController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: countryController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "Country",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: cityController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "City",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addressController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: mobileNumberController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "Mobile No",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: orderNoteController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "Order Note",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: paymentMethodController,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    labelText: "Payment Method",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.blueGrey),
                child: const Text(
                  "Order Summary",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cart Amount:Rs.${productPrice.toString()}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Delivery Charges : Rs.${delivery.toString()}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Added VAT @13% :Rs.${vat.toString()} ",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Total Amount : Rs.${totalPrice.toString()}",
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(4),
              color: const Color.fromARGB(255, 0, 0, 0),
              width: Get.width,
              height: 4,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  checkoutController.checkoutUser(
                      user: accountController.accountList[0].id.toString(),
                      product: "$productId",
                      firstName: firtNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      country: countryController.text,
                      city: cityController.text,
                      address: addressController.text,
                      phoneNumber: mobileNumberController.text,
                      orderNote: orderNoteController.text,
                      paymentMethod: paymentMethodController.text,
                      totalBill: totalPrice.toString());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(
                          255, 45, 139, 50)), // Change background color
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial', // Change font
                    color: Colors.white, // Change text color
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
