import 'package:big_cart/core/error/exception.dart';
import 'package:big_cart/core/error/failure.dart';
import 'package:big_cart/core/network/network_info.dart';
import 'package:big_cart/features/buy/data/data_sources/buy_remote_data_source.dart';
import 'package:big_cart/features/buy/data/models/cart_item_model.dart';
import 'package:big_cart/features/buy/data/models/review_model.dart';
import 'package:big_cart/features/buy/domain/entities/cart_item.dart';
import 'package:big_cart/features/buy/domain/entities/category.dart';
import 'package:big_cart/features/buy/domain/entities/product.dart';
import 'package:big_cart/features/buy/domain/entities/review.dart';
import 'package:big_cart/features/buy/domain/repositories/buy_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BuyRepository)
class BuyRepositoryImpl implements BuyRepository {
  final BuyRemoteDataSource buyRemoteDataSource;
  final NetworkInfo networkInfo;
  BuyRepositoryImpl(this.buyRemoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, Unit>> addReview(String id, Review review) async {
    if (await networkInfo.isConnected) {
      try {
        await buyRemoteDataSource.addReview(id, ReviewModel.fromEntity(review));
        return Right(unit);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addToCart(CartItem item) async {
    if (await networkInfo.isConnected) {
      try {
        await buyRemoteDataSource.addToCart(CartItemModel.fromEntity(item));
        return Right(unit);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> checkOut(List<CartItem> cart) async {
    if (await networkInfo.isConnected) {
      try {
        //only models allowed in data source. only entities are returned from this repository.
        //no need to convert models back to entities because they extend them already
        final cartModelList = cart
            .map((item) => CartItemModel.fromEntity(item))
            .toList();
        await buyRemoteDataSource.checkOut(cartModelList);
        return Right(unit);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCartItems() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await buyRemoteDataSource.getCartItems();
        return Right(response);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategoryList() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await buyRemoteDataSource.getCategoryList();
        return Right(response);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await buyRemoteDataSource.getProductList();
        return Right(response);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, List<Review>>> getProductReviews(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await buyRemoteDataSource.getProductReviews(id);
        return Right(response);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFromCart(CartItem item) async {
    if (await networkInfo.isConnected) {
      try {
        await buyRemoteDataSource.removeFromCart(
          CartItemModel.fromEntity(item),
        );
        return Right(unit);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleFavorite(
    String id,
    bool isFavorite,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await buyRemoteDataSource.toggleFavorite(id, isFavorite);
        return Right(unit);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateQuantity(
    CartItem item,
    int newQuantity,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        await buyRemoteDataSource.updateQuantity(
          CartItemModel.fromEntity(item),
          newQuantity,
        );
        return Right(unit);
      } on NoDataException {
        return Left(NoDataFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
