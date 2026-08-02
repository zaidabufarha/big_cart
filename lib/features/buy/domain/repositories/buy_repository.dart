import 'package:big_cart/core/error/failure.dart';
import 'package:big_cart/features/buy/domain/entities/cart_item.dart';
import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/domain/entities/review.dart';
import 'package:dartz/dartz.dart';

abstract class BuyRepository {
  Future<Either<Failure, List<Category>>> getCategoryList();
  Future<Either<Failure, List<Product>>> getProductList();
  Future<Either<Failure, List<Review>>> getProductReviews(String id);
  Future<Either<Failure, List<CartItem>>> getCartItems();
  Future<Either<Failure, Unit>> addToCart(CartItem item);
  Future<Either<Failure, Unit>> addReview(String id, Review review);
  Future<Either<Failure, Unit>> checkOut(List<CartItem> cart);
  Future<Either<Failure, Unit>> toggleFavorite(String id, bool isFavorite);
  Future<Either<Failure, Unit>> updateQuantity(
    CartItem cart,
    int newQuantity,
  );
  Future<Either<Failure, Unit>> removeFromCart(CartItem item);
}
