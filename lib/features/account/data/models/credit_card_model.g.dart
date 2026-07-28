// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardModel _$CreditCardModelFromJson(Map<String, dynamic> json) =>
    CreditCardModel(
      name: json['name'] as String,
      cardNumber: json['cardNumber'] as String,
      expiryDate: json['expiryDate'] as String,
      cvv: json['cvv'] as String,
      proccessor: $enumDecode(_$paymentProccessorEnumMap, json['proccessor']),
    );

Map<String, dynamic> _$CreditCardModelToJson(CreditCardModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cardNumber': instance.cardNumber,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
      'proccessor': _$paymentProccessorEnumMap[instance.proccessor]!,
    };

const _$paymentProccessorEnumMap = {
  paymentProccessor.mastercard: 'mastercard',
  paymentProccessor.paypal: 'paypal',
  paymentProccessor.visa: 'visa',
};
