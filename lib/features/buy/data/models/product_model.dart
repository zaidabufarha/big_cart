import 'package:big_cart/core/converter/color_converter.dart';
import 'package:big_cart/features/buy/data/models/category_model.dart';
import 'package:big_cart/features/buy/data/models/review_model.dart';
import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/domain/entities/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  ProductModel({
    required super.name,
    required super.imagePath,
    required super.amount,
    required super.description,
    required super.discount,
    required super.price,
    required super.isNew,
    required super.isFavorite,
    required CategoryModel category,
    required super.color,
    required List<ReviewModel> reviewList,
  }) : super(category: category, reviewList: reviewList);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
