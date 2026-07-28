import 'package:big_cart/core/api/api.dart';
import 'package:big_cart/core/error/exception.dart';
import 'package:big_cart/features/account/data/models/address_model.dart';
import 'package:big_cart/features/account/data/models/credit_card_model.dart';
import 'package:big_cart/features/account/data/models/notification_preferences_model.dart';
import 'package:big_cart/features/account/data/models/order_model.dart';
import 'package:big_cart/features/account/data/models/transaction_model.dart';
import 'package:big_cart/features/account/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class AccountRemoteDataSource {
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String currentPassword,
    required String newPassword1,
    required String newPassword2,
  });

  Future<void> addCreditCard({
    required String name,
    required String cardNumber,
    required String expiration,
    required int ccv,
    required bool saveCard,
  });
  Future<void> updateCreditCard(CreditCardModel card);

  Future<List<CreditCardModel>> getCreditCards();

  Future<void> addProfilePicture({required String path});
  Future<UserModel> getUserData();

  Future<void> addAddress({
    required String name,
    required String address,
    required String city,
    required String zip,
    required String country,
    required String phoneNumber,
    required bool makeDefault,
  });
  Future<void> updateAddress(AddressModel address);

  Future<List<AddressModel>> getAddresses();

  Future<void> setNotificationPreferences({
    required bool allowNotifications,
    required bool allowEmailNotifications,
    required bool allowOrderNotifications,
    required bool allowGeneralNotifications,
  });

  Future<NotificationPreferencesModel> getNotificationPreferences();
  Future<OrderModel> getOrder(int orderId);
  Future<List<OrderModel>> getOrders();
  Future<List<TransactionModel>> getTransactions();
}

@LazySingleton(as: AccountRemoteDataSource)
class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final ApiConsumer apiConsumer;

  AccountRemoteDataSourceImpl({required this.apiConsumer});

  //FIREBASE DOES NOT ALLOW SYMBOLS IN URL. MUST BE CLEANED FIRST
  String cleanEmail(String email) {
    return email.replaceAll('.', '_').replaceAll('@', '_at_');
  }

  @override
  Future<void> addAddress({
    required String name,
    required String address,
    required String city,
    required String zip,
    required String country,
    required String phoneNumber,
    required bool makeDefault,
  }) async {
    final output = AddressModel(
      name: name,
      address: address,
      city: city,
      country: country,
      number: phoneNumber,
      zip: zip,
    );
    try {
      await apiConsumer.post(path: 'addresses.json', data: output.toJson());
      if (makeDefault) {
        await apiConsumer.patch(path: 'default_address.json', data: output.toJson());
      }
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> addCreditCard({
    required String name,
    required String cardNumber,
    required String expiration,
    required int ccv,
    required bool saveCard,
  }) async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> addProfilePicture({required String path}) async {
    //to send a file i used multipartfile
    final formData = FormData.fromMap({
      'profile_picture': await MultipartFile.fromFile(path),
    });
    try {
      await apiConsumer.patch(path: path, data: formData);
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<CreditCardModel>> getCreditCards() async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<NotificationPreferencesModel> getNotificationPreferences() async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<OrderModel> getOrder(int orderId) async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<UserModel> getUserData() async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> setNotificationPreferences({
    required bool allowNotifications,
    required bool allowEmailNotifications,
    required bool allowOrderNotifications,
    required bool allowGeneralNotifications,
  }) async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> updateAddress(AddressModel address) async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> updateCreditCard(CreditCardModel card) async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String currentPassword,
    required String newPassword1,
    required String newPassword2,
  }) async {
    try {
      await apiConsumer;
    } on DioException {
      throw NoInternetException();
    }
  }
}
