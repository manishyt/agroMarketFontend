// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String country;
  String city;
  int id;

  AccountModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.id,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        country: json["country"],
        city: json["city"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "country": country,
        "city": city,
        "id": id,
      };
}
