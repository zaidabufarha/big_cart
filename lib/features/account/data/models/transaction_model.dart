import 'package:big_cart/features/account/domain/entities/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends Transaction {
  TransactionModel({
    required super.cost,
    required super.timestamp,
    required super.proccessor,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
