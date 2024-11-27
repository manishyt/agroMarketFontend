// To parse this JSON data, do
//
//     final refundModel = refundModelFromJson(jsonString);

import 'dart:convert';

List<RefundModel> refundModelFromJson(String str) => List<RefundModel>.from(
    json.decode(str).map((x) => RefundModel.fromJson(x)));

String refundModelToJson(List<RefundModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RefundModel {
  int id;
  String title;
  String description;

  RefundModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory RefundModel.fromJson(Map<String, dynamic> json) => RefundModel(
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
