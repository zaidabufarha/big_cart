import 'package:big_cart/features/account/domain/entities/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable()
class AddressModel extends Address {
  AddressModel({
    super.id,
    required super.name,
    required super.address,
    required super.city,
    required super.country,
    required super.number,
    required super.zip,
    super.isDefault = false,
  });

  factory AddressModel.fromEntity(Address entity) => AddressModel(
        id: entity.id,
        name: entity.name,
        address: entity.address,
        city: entity.city,
        country: entity.country,
        number: entity.number,
        zip: entity.zip,
        isDefault: entity.isDefault,
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
