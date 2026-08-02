import 'package:big_cart/features/account/domain/entities/order.dart';
import 'package:big_cart/features/account/domain/use_cases/get_order.dart';
import 'package:big_cart/features/account/domain/use_cases/get_orders.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;

part 'orders_state.dart';
part 'orders_cubit.freezed.dart';

//This only handles retrieving orders. Buy feature has the order placement
@injectable
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.getOrder, this.getOrders) : super(OrdersState.initial());
  GetOrder getOrder;
  GetOrders getOrders;

  void attemptGetOrder(int id) async {
    emit(OrdersState.loading());
    final result = await getOrder.call(id);
    result.fold(
      (failure) {
        emit(OrdersState.error(failure.message));
      },
      (order) {
        emit(OrdersState.loadedOrder(order));
      },
    );
  }

  void attemptGetOrders() async {
    emit(OrdersState.loading());
    final result = await getOrders.call();
    result.fold(
      (failure) {
        emit(OrdersState.error(failure.message));
      },
      (list) {
        emit(OrdersState.loadedList(list));
      },
    );
  }
}
