import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mad_assignment/controllers/shop/fruits_controller.dart';
import 'package:mad_assignment/controllers/shop/dairyProducts_controller.dart';
import 'package:mad_assignment/controllers/shop/fertilizers_controller.dart';
import 'package:mad_assignment/controllers/shop/vegetables_controller.dart';
import 'package:mad_assignment/controllers/shop/grains_controller.dart';
import 'package:mad_assignment/controllers/user/account_controller.dart';
import 'package:mad_assignment/controllers/shop/baseProductController.dart';
import 'package:mad_assignment/controllers/shop/cart_controller.dart';
import 'package:mad_assignment/controllers/shop/whitelist_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  AccountController accountController = AccountController();
  BaseProductController baseProductController = BaseProductController();
  CartController cartController = CartController();
  WhitelistController whitelistController = WhitelistController();
  FruitsController fruitsController = FruitsController();
  VegetablesController vegetablesController = VegetablesController();
  GrainsController grainsController = GrainsController();
  FertilizersController fertilizersController = FertilizersController();
  DairyproductsController dairyProductsController = DairyproductsController();
  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fixed color instantiation
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text("Shopingo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                ],
              ),
              SingleChildScrollView(
                child: Row(
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
                ),
              )
            ],
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
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
                            // Get.toNamed('/checkout');
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
                title: Text(accountController.accountList[0].email.toString()),
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
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 182, 212),
                borderRadius: BorderRadius.circular(10)),
            height: Get.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  return FutureBuilder(
                    future: baseProductController.fetchBaseProduct(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Display a loading indicator while data is being fetched
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        // Handle error case
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // Data has been successfully fetched
                        return ListView.builder(
                          scrollDirection: Axis
                              .horizontal, // Set the scroll direction to horizontal
                          itemCount:
                              baseProductController.baseProductList.length,
                          itemBuilder: (context, index) =>
                              SingleChildScrollView(
                            scrollDirection: Axis
                                .horizontal, // Also set the scroll direction for the row
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed('/checkout', parameters: {
                                          'product_id': baseProductController
                                              .baseProductList[index].id
                                              .toString(),
                                          'product_price': baseProductController
                                              .baseProductList[index].price
                                              .toString()
                                        });
                                      },
                                      child: Image.network(
                                        baseProductController
                                            .baseProductList[index].image
                                            .toString(),
                                        height: Get.height * 0.5,
                                        width: Get.width,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const Text(
                                        "   <<  Click Here & Get 10 % CashBack  >> ",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            color: Color.fromARGB(
                                                255, 236, 253, 0)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("TRENDING FRUITS COLLECTION",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("MOST SELLING PRODUCTS OF THE MONTH",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height,
            child: Expanded(
              child: FutureBuilder(
                  future: fruitsController.fetchFruits(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: fruitsController.fruitsList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      fruitsController.fruitsList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      fruitsController.fruitsList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${fruitsController.fruitsList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RECOMMEND  Vegetables PRODUCTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OUR BEST PRODUCTS RECOMMENDED FOR YOU",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height,
            child: Expanded(
              child: FutureBuilder(
                  future: vegetablesController.fetchVegetables(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: vegetablesController.vegetablesList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      vegetablesController
                                          .vegetablesList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      vegetablesController
                                          .vegetablesList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${vegetablesController.vegetablesList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RECOMMEND   GRAINS PRODUCTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OUR BEST PRODUCTS RECOMMENDED FOR YOU",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height,
            child: Expanded(
              child: FutureBuilder(
                  future: grainsController.fetchGrains(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: grainsController.grainsList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      grainsController.grainsList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      grainsController.grainsList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${dairyProductsController.dairyProductsList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OURS BEST FERTILIZERS PRODUCTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OUR BEST FERTILIZERS FOR YOU",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height,
            child: Expanded(
              child: FutureBuilder(
                  future: fertilizersController.fetchFertilizers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: fertilizersController.fertilizersList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/checkout', parameters: {
                                        'product_id': baseProductController
                                            .baseProductList[index].id
                                            .toString(),
                                        'product_price': baseProductController
                                            .baseProductList[index].price
                                            .toString()
                                      });
                                    },
                                    child: Image.network(
                                      fertilizersController
                                          .fertilizersList[index].image
                                          .toString(),
                                      height: Get.height * 0.3,
                                      width: Get.width,
                                      fit: BoxFit.fill,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      fertilizersController
                                          .fertilizersList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text(
                                        "Rs. ${fertilizersController.fertilizersList[index].price.toString()}",
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16)),
                                    IconButton(
                                        onPressed: () {
                                          cartController.addCart(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.shopping_basket_rounded)),
                                    IconButton(
                                        onPressed: () {
                                          whitelistController.addWhitelist(
                                              userId: accountController
                                                  .accountList[0].id
                                                  .toString(),
                                              productId: baseProductController
                                                  .baseProductList[index].id
                                                  .toString());
                                        },
                                        icon: const Icon(Icons.favorite))
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("RECOMMEND DAIRY PRODUCTS",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" BEST SELLING DAIRY PRODUCTS",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: Get.height,
            child: Expanded(
              child: FutureBuilder(
                  future: dairyProductsController.fetchDairyProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Loading state
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}'); // Error state
                    } else {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount:
                            dairyProductsController.dairyProductsList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.toNamed('/checkout', parameters: {
                                          'product_id': baseProductController
                                              .baseProductList[index].id
                                              .toString(),
                                          'product_price': baseProductController
                                              .baseProductList[index].price
                                              .toString()
                                        });
                                      },
                                      child: Image.network(
                                        dairyProductsController
                                            .dairyProductsList[index].image
                                            .toString(),
                                        height: Get.height * 0.3,
                                        width: Get.width,
                                        fit: BoxFit.fill,
                                      )),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          dairyProductsController
                                              .dairyProductsList[index].name
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          maxLines: 2,
                                        ),
                                        Text(
                                            "Rs. ${dairyProductsController.dairyProductsList[index].price.toString()}",
                                            style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16)),
                                        IconButton(
                                            onPressed: () {
                                              cartController.addCart(
                                                  userId: accountController
                                                      .accountList[0].id
                                                      .toString(),
                                                  productId:
                                                      baseProductController
                                                          .baseProductList[
                                                              index]
                                                          .id
                                                          .toString());
                                            },
                                            icon: const Icon(
                                                Icons.shopping_basket_rounded)),
                                        IconButton(
                                            onPressed: () {
                                              whitelistController.addWhitelist(
                                                  userId: accountController
                                                      .accountList[0].id
                                                      .toString(),
                                                  productId:
                                                      baseProductController
                                                          .baseProductList[
                                                              index]
                                                          .id
                                                          .toString());
                                            },
                                            icon: const Icon(Icons.favorite))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text(
                "Follow Us",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Colors.yellowAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.facebook_rounded),
                        label: const Text("")),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.auto_awesome_outlined),
                        label: const Text("")),
                  ],
                )),
          ),
          const SizedBox(
              child: Text(
            "Copyright 2024-ALL RIGHTS RESERVED",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
