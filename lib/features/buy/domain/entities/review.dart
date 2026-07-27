import 'package:big_cart/features/account/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Review {
  User user;
  DateTime timestamp;
  double rating;
  String content;
  Review({
    required this.user,
    required this.content,
    required this.rating,
    required this.timestamp,
  });
}
