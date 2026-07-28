import 'package:big_cart/core/converter/color_converter.dart';
import 'package:big_cart/core/converter/entity_converters.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(
  converters: [CategoryConverter(), ReviewConverter(), ColorConverter()],
)
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
    required super.category,
    required super.color,
    required super.reviewList,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
