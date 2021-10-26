import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/models/category.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  final String name;
  final String details;
  final String size;
  final String colour;
  final double price;
  final int sold_count;
  final Category category;

  Product(
      {required this.name,
      required this.details,
      required this.size,
      required this.colour,
      required this.price,
      required this.sold_count,
      required this.category});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
