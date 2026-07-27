import 'package:big_cart/core/api/api.dart';
import 'package:big_cart/core/error/exception.dart';
import 'package:big_cart/features/account/data/models/user_model.dart';
import 'package:big_cart/features/account/domain/entities/user.dart';
import 'package:big_cart/features/auth/domain/use%20cases/send_otp.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> sendOtp(String email);
  Future<Unit> verifyOtp({required String email, required String otp});
  Future<User> logIn({
    required String email,
    required String password,
    required bool remember,
  });
  Future<User> signUp({
    required String email,
    required String password,
    required String number,
  });
  Future<Unit> forgotPassword({
    required String email,
  });
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  //FIREBASE DOES NOT ALLOW SYMBOLS IN URL. MUST BE CLEANED FIRST
  String cleanEmail(String email) {
    return email.replaceAll('.', '_').replaceAll('@', '_at_');
  }

  @override
  Future<Unit> forgotPassword({required String email}) async {
    try {
      final response = await apiConsumer.post(
        path: 'password_requests.json',
        data: {'email': email},
      );
      return unit; //no need to check statuscode because dio already throws errors
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<User> logIn({
    required String email,
    required String password,
    required bool remember,
  }) async {
    try {
      final response = await apiConsumer.get(
        path: 'users/${cleanEmail(email)}.json',
      );
      if (response.data == null) {
        throw InvalidEmailException();
      } else if (response.data['password'] != password) {
        throw WrongPasswordException();
      } else {
        final userData = Map<String, dynamic>.from(response.data);
        return UserModel.fromJson(userData);
      }
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<Unit> sendOtp(String email) async {
    try {
      final response = await apiConsumer.post(
        path: 'otp_requests.json',
        data: {'email': email},
      );
      return unit;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<User> signUp({
    required String email,
    required String password,
    required String number,
  }) async {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<Unit> verifyOtp({required String email, required String otp}) async {
    //i cant test this without a backend because i need to generate OTPs and attach them to emails
    if (otp == '123456') {
      return unit;
    } else {
      throw WrongOTPException();
    }
  }
}
