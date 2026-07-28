import 'package:big_cart/core/error/failure.dart';
import 'package:big_cart/features/account/domain/entities/order.dart';
import 'package:big_cart/features/account/domain/repositories/account_repository.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart' hide Order;

@lazySingleton
class GetOrder {
  final AccountRepository accountRepository;
  GetOrder({required this.accountRepository});

  Future<Either<Failure, Order>> call(int orderId) async {
    return await accountRepository.getOrder(orderId);
  }
}
