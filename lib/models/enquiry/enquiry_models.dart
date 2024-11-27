// To parse this JSON data, do
//
//     final enquiryModel = enquiryModelFromJson(jsonString);

import 'dart:convert';

List<EnquiryModel> enquiryModelFromJson(String str) => List<EnquiryModel>.from(
    json.decode(str).map((x) => EnquiryModel.fromJson(x)));

String enquiryModelToJson(List<EnquiryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EnquiryModel {
  int id;
  String firstName;
  String lastName;
  String email;
  String message;

  EnquiryModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.message,
  });

  factory EnquiryModel.fromJson(Map<String, dynamic> json) => EnquiryModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "message": message,
      };
}
