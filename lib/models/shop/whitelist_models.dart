// To parse this JSON data, do
//
//     final whitelistModel = whitelistModelFromJson(jsonString);

import 'dart:convert';

List<WhitelistModel> whitelistModelFromJson(String str) =>
    List<WhitelistModel>.from(
        json.decode(str).map((x) => WhitelistModel.fromJson(x)));

String whitelistModelToJson(List<WhitelistModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WhitelistModel {
  int id;
  int user;
  int product;
  int quantity;
  ProductDetails productDetails;

  WhitelistModel({
    required this.id,
    required this.user,
    required this.product,
    required this.quantity,
    required this.productDetails,
  });

  factory WhitelistModel.fromJson(Map<String, dynamic> json) => WhitelistModel(
        id: json["id"],
        user: json["user"],
        product: json["product"],
        quantity: json["quantity"],
        productDetails: ProductDetails.fromJson(json["product_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "product": product,
        "quantity": quantity,
        "product_details": productDetails.toJson(),
      };
}

class ProductDetails {
  int id;
  String name;
  double price;
  String image;
  String description;

  ProductDetails({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
      };
}
