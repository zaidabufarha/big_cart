import 'package:big_cart/features/account/domain/entities/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class CreditCard {
  String name;
  String cardNumber;
  String expiryDate;
  String cvv;
  paymentProccessor proccessor;
  CreditCard({
    required this.name,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
    required this.proccessor,
  });
}
