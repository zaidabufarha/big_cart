import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Address {
  String name;
  String address;
  String city;
  String zip; //postal code is more universal but i want to match the figma file
  String country;
  String number;
  Address({
    required this.name,
    required this.address,
    required this.city,
    required this.country,
    required this.number,
    required this.zip,
  });
}
