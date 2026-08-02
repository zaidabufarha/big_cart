import 'package:big_cart/core/api/api.dart';
import 'package:big_cart/core/error/exception.dart';
import 'package:big_cart/core/session/user_local_data_source.dart';
import 'package:big_cart/features/account/data/models/order_model.dart';
import 'package:big_cart/features/buy/data/models/cart_item_model.dart';
import 'package:big_cart/features/buy/data/models/category_model.dart';
import 'package:big_cart/features/buy/data/models/product_model.dart';
import 'package:big_cart/features/buy/data/models/review_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class BuyRemoteDataSource {
  Future<List<CategoryModel>> getCategoryList();
  Future<List<ProductModel>> getProductList();
  Future<List<ReviewModel>> getProductReviews(String id);
  Future<List<CartItemModel>> getCartItems();
  Future<Unit> addToCart(CartItemModel item);
  Future<Unit> addReview(String id, ReviewModel review);
  Future<Unit> checkOut(List<CartItemModel> cart);
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
      final path = await _getUserPath('products/$id/reviews.json');
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
      await apiConsumer.patch(path: path, data: item.toJson());
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }

  //REMEMBER TO ADD A TRANSACTION
  @override
  Future<Unit> checkOut(List<CartItemModel> cart) async {
    try {
      final orderPath = await _getUserPath('orders.json');
      final order = OrderModel(productList: cart, datePlaced: DateTime.now());
      await apiConsumer.post(path: orderPath, data: order.toJson());
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<CartItemModel>> getCartItems() async {
    try {
      final path = await _getUserPath('cart.json');
      Map<String, dynamic>? response = await apiConsumer.get(path: path);
      if (response == null) {
        throw NoDataException();
      }
      List<CartItemModel> list = [];
      for (dynamic value in response.values) {
        list.add(CartItemModel.fromJson(value));
      }
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<CategoryModel>> getCategoryList() async {
    try {
      final path = await _getUserPath('categories.json');
      Map<String, dynamic>? response = await apiConsumer.get(path: path);
      if (response == null) {
        throw NoDataException();
      }
      List<CategoryModel> list = [];
      for (dynamic value in response.values) {
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
      final path = await _getUserPath('products.json');
      Map<String, dynamic>? response = await apiConsumer.get(path: path);
      if (response == null) {
        throw NoDataException();
      }
      List<ProductModel> list = [];
      response.forEach((key, value) {
        final json = Map<String, dynamic>.from(value as Map);
        json['id'] = key; // giving id to products without
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
      final path = await _getUserPath('products/$id.json');
      Map<String, dynamic>? response = await apiConsumer.get(path: path);
      if (response == null) {
        throw NoDataException();
      }
      List<ReviewModel> list = [];
      for (dynamic value in response.values) {
        list.add(ReviewModel.fromJson(value));
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
      final path = await _getUserPath('products/$id.json');
      await apiConsumer.patch(path: path, data: {'isFavorite': isFavorite});
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
