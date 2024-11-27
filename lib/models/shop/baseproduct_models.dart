// To parse this JSON data, do
//
//     final baseProductModel = baseProductModelFromJson(jsonString);

import 'dart:convert';

List<BaseProductModel> baseProductModelFromJson(String str) =>
    List<BaseProductModel>.from(
        json.decode(str).map((x) => BaseProductModel.fromJson(x)));

String baseProductModelToJson(List<BaseProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BaseProductModel {
  int id;
  String name;
  double price;
  String image;
  String description;

  BaseProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  factory BaseProductModel.fromJson(Map<String, dynamic> json) =>
      BaseProductModel(
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
