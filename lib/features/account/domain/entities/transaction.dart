import 'package:freezed_annotation/freezed_annotation.dart';

enum paymentProccessor { mastercard, paypal, visa }

@JsonSerializable()
class Transaction {
  double cost;
  DateTime timestamp;
  paymentProccessor proccessor;
  Transaction({
    required this.cost,
    required this.timestamp,
    required this.proccessor,
  });
}
