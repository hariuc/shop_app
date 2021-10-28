// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  dynamic jsonCategories = json['category'];
  if (json['category'] is String) {
    jsonCategories = jsonDecode(jsonCategories);
  }
  return Product(
    name: json['name'] as String,
    details: json['details'] as String,
    size: json['size'] as String,
    colour: json['colour'] as String,
    price: (json['price'] as num).toDouble(),
    category: Category.fromJson(jsonCategories as Map<String, dynamic>),
    sold_count: json['sold_count'] as int?,
    main_image: json['main_image'] as String?,
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..id = json['id'] as int?;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'details': instance.details,
      'size': instance.size,
      'colour': instance.colour,
      'price': instance.price,
      'sold_count': instance.sold_count,
      'category': json.encode(instance.category.toJson()),
      'main_image': instance.main_image,
      'images': instance.images,
    };
