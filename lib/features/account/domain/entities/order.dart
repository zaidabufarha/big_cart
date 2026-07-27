import 'package:big_cart/features/buy/domain/entities/product.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Order {
  int id;
  List<Product> productList;
  DateTime datePlaced;
  DateTime? dateConfirmed;
  DateTime? dateShipped;
  DateTime? dateOutForDelivery;
  DateTime? dateDelivered;
  Order({
    required this.id,
    required this.productList,
    required this.datePlaced,
    this.dateConfirmed,
    this.dateShipped,
    this.dateOutForDelivery,
    this.dateDelivered,
  });
}
