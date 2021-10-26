// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      details: json['details'] as String,
      size: json['size'] as String,
      colour: json['colour'] as String,
      price: (json['price'] as num).toDouble(),
      sold_count: json['sold_count'] as int,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    )..id = json['id'] as int?;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'size': instance.size,
      'colour': instance.colour,
      'price': instance.price,
      'sold_count': instance.sold_count,
      'category': instance.category,
    };
