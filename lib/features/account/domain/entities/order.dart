import 'package:big_cart/features/buy/domain/entities/cart_item.dart';

class Order {
  int? id;
  List<CartItem> productList;
  DateTime datePlaced;
  DateTime? dateConfirmed;
  DateTime? dateShipped;
  DateTime? dateOutForDelivery;
  DateTime? dateDelivered;

  Order({
    this.id,
    required this.productList,
    required this.datePlaced,
    this.dateConfirmed,
    this.dateDelivered,
    this.dateOutForDelivery,
    this.dateShipped,
  });
}
