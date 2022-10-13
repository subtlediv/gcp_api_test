import 'dart:convert';

List<Product>? productsFromJson(String str) => List<Product>.from(json
    .decode(str)["responses"][0]["productSearchResults"]["results"]
    .map((x) => Product.fromJson(x["product"])));

class Product {
  String? name;
  String? displayName;
  String? productCategory;
  List<String>? productLabels;

  Product(
      {required this.name,
      required this.displayName,
      required this.productCategory,
      required this.productLabels});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      name: json["name"],
      displayName: json["displayName"],
      productCategory: json["productCategory"],
      productLabels:
          List<String>.from(json["productLabels"].map((x) => x.toString())));
}
