import 'package:big_cart/features/buy/domain/entities/product.dart';

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
    this.dateDelivered,
    this.dateOutForDelivery,
    this.dateShipped,
  });
}
