import 'package:big_cart/core/converter/entity_converters.dart';
import 'package:big_cart/features/account/domain/entities/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(converters: [CartItemConverter()])
class OrderModel extends Order {
  OrderModel({
    super.id,
    required super.productList,
    required super.datePlaced,
  });

  factory OrderModel.fromEntity(Order entity) => OrderModel(
    id: entity.id,
    productList: entity.productList,
    datePlaced: entity.datePlaced,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
