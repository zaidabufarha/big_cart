import 'package:big_cart/core/converter/entity_converters.dart';
import 'package:big_cart/features/account/domain/entities/address.dart';
import 'package:big_cart/features/account/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(
  converters: [
    AddressConverter(),
    CreditCardConverter(),
    OrderConverter(),
    TransactionConverter(),
  ],
)
class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.number,
    required super.password,
    super.imagePath,
    super.defaultAddress,
    super.creditCardList = const [],
    super.addressList = const [],
    super.orderList = const [],
    super.transactionList = const [],
  });

  factory UserModel.fromEntity(User entity) => UserModel(
        name: entity.name,
        email: entity.email,
        number: entity.number,
        password: entity.password,
        imagePath: entity.imagePath,
        defaultAddress: entity.defaultAddress,
        creditCardList: entity.creditCardList,
        addressList: entity.addressList,
        orderList: entity.orderList,
        transactionList: entity.transactionList,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
