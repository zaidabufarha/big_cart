import 'package:big_cart/features/account/data/models/user_model.dart';
import 'package:big_cart/features/buy/domain/entities/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel extends Review {
  ReviewModel({
    required UserModel user,
    required super.content,
    required super.rating,
    required super.timestamp,
  }) : super(user: user);

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
