// To parse this JSON data, do
//
//     final termsConditionsModel = termsConditionsModelFromJson(jsonString);

import 'dart:convert';

List<TermsConditionsModel> termsConditionsModelFromJson(String str) =>
    List<TermsConditionsModel>.from(
        json.decode(str).map((x) => TermsConditionsModel.fromJson(x)));

String termsConditionsModelToJson(List<TermsConditionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TermsConditionsModel {
  int id;
  String title;
  String description;

  TermsConditionsModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory TermsConditionsModel.fromJson(Map<String, dynamic> json) =>
      TermsConditionsModel(
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
