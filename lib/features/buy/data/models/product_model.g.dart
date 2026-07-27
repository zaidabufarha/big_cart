// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  name: json['name'] as String,
  imagePath: json['imagePath'] as String,
  amount: json['amount'] as String,
  description: json['description'] as String,
  discount: (json['discount'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  isNew: json['isNew'] as bool,
  isFavorite: json['isFavorite'] as bool,
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  color: const ColorConverter().fromJson((json['color'] as num).toInt()),
  reviewList: (json['reviewList'] as List<dynamic>)
      .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imagePath': instance.imagePath,
      'amount': instance.amount,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'isNew': instance.isNew,
      'isFavorite': instance.isFavorite,
      'category': instance.category,
      'color': const ColorConverter().toJson(instance.color),
      'reviewList': instance.reviewList,
    };
