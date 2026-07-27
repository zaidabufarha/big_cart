import 'dart:convert';

import 'package:big_cart/features/account/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> isFirstTime();
  Future<Unit> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<Unit> clearCache();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheUser(UserModel user) async {
    final json = user.toJson();
    await sharedPreferences.setString('CACHED_USER', jsonEncode(json));
    await sharedPreferences.setBool('FIRST_TIME', false);
    return unit;
  }

  @override
  Future<Unit> clearCache() async {
    await sharedPreferences.clear();
    return unit;
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final userJson = await sharedPreferences.getString('CACHED_USER');
    if (userJson == null) {
      return null;
    } else {
      final map = jsonDecode(userJson);
      return UserModel.fromJson(map);
    }
  }

  @override
  Future<bool> isFirstTime() async {
    final response = await sharedPreferences.getBool('FIRST_TIME');
    if (response == null) {
      return true;
    } else {
      return response; //should be true
    }
  }
}
