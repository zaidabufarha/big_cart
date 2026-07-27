import 'package:big_cart/features/account/domain/entities/address.dart';
import 'package:big_cart/features/account/domain/entities/credit_card.dart';
import 'package:big_cart/features/account/domain/entities/order.dart';
import 'package:big_cart/features/account/domain/entities/transaction.dart';
import 'package:big_cart/features/account/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.number,
    required super.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
