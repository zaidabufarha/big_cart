// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
  name: json['name'] as String,
  address: json['address'] as String,
  city: json['city'] as String,
  country: json['country'] as String,
  number: json['number'] as String,
  zip: json['zip'] as String,
);

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'number': instance.number,
      'zip': instance.zip,
    };
