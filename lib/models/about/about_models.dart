// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromJson(jsonString);

import 'dart:convert';

List<AboutModel> aboutModelFromJson(String str) =>
    List<AboutModel>.from(json.decode(str).map((x) => AboutModel.fromJson(x)));

String aboutModelToJson(List<AboutModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AboutModel {
  int id;
  String title;
  String description;

  AboutModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
