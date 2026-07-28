import 'package:big_cart/core/converter/entity_converters.dart';
import 'package:big_cart/features/account/domain/entities/credit_card.dart';
import 'package:big_cart/features/account/domain/entities/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_model.g.dart';

@JsonSerializable(converters: [TransactionConverter()])
class CreditCardModel extends CreditCard {
  CreditCardModel({
    required super.name,
    required super.cardNumber,
    required super.expiryDate,
    required super.cvv,
    required super.proccessor,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardModelToJson(this);
}
