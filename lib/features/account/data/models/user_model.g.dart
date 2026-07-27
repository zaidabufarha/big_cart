// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) =>
    UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        number: json['number'] as String,
        password: json['password'] as String,
      )
      ..imagePath = json['imagePath'] as String
      ..defaultAddress = json['defaultAddress'] == null
          ? null
          : Address.fromJson(json['defaultAddress'] as Map<String, dynamic>)
      ..creditCardList = (json['creditCardList'] as List<dynamic>)
          .map((e) => CreditCard.fromJson(e as Map<String, dynamic>))
          .toList()
      ..addressList = (json['addressList'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList()
      ..orderList = (json['orderList'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList()
      ..transactionList = (json['transactionList'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'number': instance.number,
  'password': instance.password,
  'imagePath': instance.imagePath,
  'defaultAddress': instance.defaultAddress,
  'creditCardList': instance.creditCardList,
  'addressList': instance.addressList,
  'orderList': instance.orderList,
  'transactionList': instance.transactionList,
};
