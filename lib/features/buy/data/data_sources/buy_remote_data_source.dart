import 'package:big_cart/core/api/api.dart';
import 'package:big_cart/core/error/exception.dart';
import 'package:big_cart/core/session/user_local_data_source.dart';
import 'package:big_cart/features/account/data/models/order_model.dart';
import 'package:big_cart/features/account/data/models/transaction_model.dart';
import 'package:big_cart/features/buy/data/models/cart_item_model.dart';
import 'package:big_cart/features/buy/data/models/category_model.dart';
import 'package:big_cart/features/buy/data/models/product_model.dart';
import 'package:big_cart/features/buy/data/models/review_model.dart';
import 'package:big_cart/features/buy/domain/entities/cart_item.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class BuyRemoteDataSource {
  Future<List<CategoryModel>> getCategoryList();
  Future<List<ProductModel>> getProductList();
  Future<List<ReviewModel>> getProductReviews(String id);
  Future<List<CartItemModel>> getCartItems({bool isFavorites = false});
  Future<Unit> addToCart(CartItemModel item);
  Future<Unit> addReview(String id, ReviewModel review);
  Future<Unit> checkOut(OrderModel order);
  Future<Unit> toggleFavorite(String id, bool isFavorite);
  Future<Unit> updateQuantity(
    CartItemModel item,
    int newQuantity,
  );
  Future<Unit> removeFromCart(CartItemModel item);
}

@LazySingleton(as: BuyRemoteDataSource)
class BuyRemoteDataSourceImpl implements BuyRemoteDataSource {
  final ApiConsumer apiConsumer;
  final UserLocalDataSource userLocalDataSource; //centralized cache access

  BuyRemoteDataSourceImpl({
    required this.apiConsumer,
    required this.userLocalDataSource,
  });

  //FIREBASE DOES NOT ALLOW SYMBOLS IN URL. MUST BE CLEANED FIRST
  String cleanEmail(String email) {
    return email.replaceAll('.', '_').replaceAll('@', '_at_');
  }

  Future<String> _getUserPath(String subPath) async {
    final user = await userLocalDataSource.getCachedUser();
    if (user == null) {
      throw EmptyCacheException();
    }
    final clean = cleanEmail(user.email);
    return 'users/$clean/$subPath';
  }

  @override
  Future<Unit> addReview(String id, ReviewModel review) async {
    try {
      final path = 'products/$id/reviews.json';
      await apiConsumer.post(path: path, data: review.toJson());
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<Unit> addToCart(CartItemModel item) async {
    try {
      final path = await _getUserPath('cart/${item.product.id}.json');
      await apiConsumer.put(path: path, data: item.toJson());
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }

  //REMEMBER TO ADD A TRANSACTION
  @override
  Future<Unit> checkOut(OrderModel order) async {
    try {
      final orderPath = await _getUserPath('orders.json');
      await apiConsumer.post(path: orderPath, data: order.toJson());

      double sum = 0;
      for (CartItem item in order.productList) {
        sum +=
            item.product.price *
            item.quantity *
            (100 - item.product.discount) /
            100;
      }
      final transaction = TransactionModel(
        cost: sum,
        timestamp: order.datePlaced,
        proccessor: order.creditCard.proccessor,
      );
      final transactionPath = await _getUserPath('transactions.json');
      await apiConsumer.post(path: transactionPath, data: transaction.toJson());

      final cartPath = await _getUserPath('cart.json');
      await apiConsumer.delete(path: cartPath);
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<CartItemModel>> getCartItems({bool isFavorites = false}) async {
    try {
      final path = await _getUserPath(
        isFavorites ? 'favorites.json' : 'cart.json',
      );
      final response = await apiConsumer.get(path: path);
      if (response.data == null) {
        return [];
      }
      List<CartItemModel> list = [];
      for (dynamic value in response.data.values) {
        if (value['product'] != null) {
          value['product']['reviewList'] ??= [];
          list.add(CartItemModel.fromJson(value));
        }
      }
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<CategoryModel>> getCategoryList() async {
    try {
      final response = await apiConsumer.get(
        path: 'categories.json',
      );
      if (response.data == null) {
        throw NoDataException();
      }
      List<CategoryModel> list = [];
      for (dynamic value in response.data.values) {
        list.add(CategoryModel.fromJson(value));
      }
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<ProductModel>> getProductList() async {
    try {
      final response = await apiConsumer.get(
        path: 'products.json',
      );
      final favoritePath = await _getUserPath('favorites.json');
      final favoriteResponse = await apiConsumer.get(
        path: favoritePath,
      );
      if (response.data == null) {
        throw NoDataException();
      }
      final favoriteData = favoriteResponse.data ?? {};
      List<ProductModel> list = [];
      response.data.forEach((key, value) {
        final json = Map<String, dynamic>.from(value as Map);
        json['id'] = key; // giving id to products without
        json['reviewList'] ??= [];
        json['isFavorite'] = favoriteData.containsKey(key);
        list.add(ProductModel.fromJson(json));
      });
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<ReviewModel>> getProductReviews(String id) async {
    try {
      final response = await apiConsumer.get(
        path: 'products/$id/reviews.json',
      );
      if (response.data == null) {
        return [];
      }
      List<ReviewModel> list = [];
      if (response.data is Map) {
        // not empty
        for (dynamic value in (response.data as Map).values) {
          list.add(ReviewModel.fromJson(value as Map<String, dynamic>));
        }
      }
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<Unit> removeFromCart(CartItemModel item) async {
    try {
      final path = await _getUserPath('cart/${item.product.id}.json');
      await apiConsumer.delete(path: path);
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<Unit> toggleFavorite(String id, bool isFavorite) async {
    try {
      final path = await _getUserPath('favorites/$id.json');
      if (isFavorite) {
        final response = await apiConsumer.get(path: 'products/$id.json');
        if (response.data != null) {
          response.data['reviewList'] ??= [];
          final product = ProductModel.fromJson(response.data);
          product.isFavorite = true;
          final item = CartItemModel(
            product,
            1,
          ); //not sure what quantity is supposed to do in the favorites page
          await apiConsumer.put(path: path, data: item.toJson());
        }
      } else {
        await apiConsumer.delete(path: path);
      }
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<Unit> updateQuantity(CartItemModel item, int newQuantity) async {
    try {
      final path = await _getUserPath('cart/${item.product.id}.json');
      await apiConsumer.patch(path: path, data: {'quantity': newQuantity});
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }
}
