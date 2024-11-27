import 'dart:convert';

// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  int id;
  int user;
  int product;
  String firstName;
  String lastName;
  String email;
  String country;
  String city;
  String address;
  int mobileNumber;
  String orderNote;
  String paymentMethod;
  double totalBill; // Assuming totalBill is a double
  String orderStatus;
  ProductDetails productDetails;

  OrderModel({
    required this.id,
    required this.user,
    required this.product,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.country,
    required this.city,
    required this.address,
    required this.mobileNumber,
    required this.orderNote,
    required this.paymentMethod,
    required this.totalBill,
    required this.orderStatus,
    required this.productDetails,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        user: json["user"],
        product: json["product"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        country: json["country"],
        city: json["city"],
        address: json["address"],
        mobileNumber: json["mobile_number"],
        orderNote: json["order_note"],
        paymentMethod: json["payment_method"],
        totalBill: json["total_bill"].toDouble(), // Convert to double
        orderStatus: json["order_status"],
        productDetails: ProductDetails.fromJson(json["product_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "product": product,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "country": country,
        "city": city,
        "address": address,
        "mobile_number": mobileNumber,
        "order_note": orderNote,
        "payment_method": paymentMethod,
        "total_bill": totalBill, // Ensure it's a double
        "order_status": orderStatus,
        "product_details": productDetails.toJson(),
      };
}

class ProductDetails {
  int id;
  String name;
  double price; // Assuming price is a double
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
        price: json["price"].toDouble(), // Convert to double
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price, // Ensure it's a double
        "image": image,
        "description": description,
      };
}
