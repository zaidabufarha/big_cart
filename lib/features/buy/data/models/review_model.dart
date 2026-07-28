import 'package:big_cart/core/converter/entity_converters.dart';
import 'package:big_cart/features/buy/domain/entities/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable(converters: [UserConverter()])
class ReviewModel extends Review {
  ReviewModel({
    required super.user,
    required super.content,
    required super.rating,
    required super.timestamp,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
