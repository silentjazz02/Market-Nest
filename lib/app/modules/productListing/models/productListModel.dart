import 'dart:convert';

import 'productModel.dart';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) => json.encode(data.toJson());

class ProductListModel {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  ProductListModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}