import 'package:big_cart/core/api/api.dart';
import 'package:big_cart/core/error/exception.dart';
import 'package:big_cart/core/session/user_local_data_source.dart';
import 'package:big_cart/features/account/data/models/address_model.dart';
import 'package:big_cart/features/account/data/models/credit_card_model.dart';
import 'package:big_cart/features/account/data/models/notification_preferences_model.dart';
import 'package:big_cart/features/account/data/models/order_model.dart';
import 'package:big_cart/features/account/data/models/transaction_model.dart';
import 'package:big_cart/features/account/data/models/user_model.dart';
import 'package:big_cart/features/account/domain/entities/transaction.dart';
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
    required String cvv,
    required bool saveCard,
    required paymentProccessor proccessor,
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
  final UserLocalDataSource userLocalDataSource;

  AccountRemoteDataSourceImpl({
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
      final addressesPath = await _getUserPath('addresses.json');
      await apiConsumer.post(path: addressesPath, data: output.toJson());
      if (makeDefault) {
        final defaultAddressPath = await _getUserPath('defaultAddress.json');
        await apiConsumer.patch(
          path: defaultAddressPath,
          data: output.toJson(),
        );
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
    required String cvv,
    required bool saveCard,
    required paymentProccessor proccessor,
  }) async {
    try {
      final output = CreditCardModel(
        name: name,
        cardNumber: cardNumber,
        expiryDate: expiration,
        cvv: cvv,
        proccessor: proccessor,
      );
      final creditCardPath = await _getUserPath('credit_cards.json');
      await apiConsumer.post(path: creditCardPath, data: output.toJson());
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
    final profilePicturePath = await _getUserPath('profile_picture.json');
    try {
      await apiConsumer.patch(path: profilePicturePath, data: formData);
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    try {
      final addressPath = await _getUserPath('addresses.json');
      final response = await apiConsumer.get(path: addressPath);
      List<AddressModel> list = [];
      final data = response.data;
      if (data is Map) {
        for (dynamic entry in data.entries) {
          final temp = AddressModel.fromJson(entry.value);
          temp.id = entry.key;
          list.add(temp);
        }
      }
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<CreditCardModel>> getCreditCards() async {
    try {
      final creditCardPath = await _getUserPath('credit_cards.json');
      final response = await apiConsumer.get(path: creditCardPath);
      List<CreditCardModel> list = [];
      final data = response.data;
      if (data is Map) {
        for (dynamic entry in data.entries) {
          final temp = CreditCardModel.fromJson(entry.value);
          temp.id = entry.key;
          list.add(temp);
        }
      }
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<NotificationPreferencesModel> getNotificationPreferences() async {
    try {
      final notificationPrefsPath = await _getUserPath(
        'notification_preferences.json',
      );
      final response = await apiConsumer.get(path: notificationPrefsPath);
      return NotificationPreferencesModel.fromJson(response);
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<OrderModel> getOrder(int orderId) async {
    try {
      final orderPath = await _getUserPath('orders.json');
      final response = await apiConsumer.get(path: orderPath);
      if (response.data == null) {
        throw NoDataException();
      }
      for (dynamic order in response.data.values) {
        final temp = OrderModel.fromJson(order);
        if (temp.id == orderId) {
          return temp;
        }
      }
      throw NoInternetException();
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      List<OrderModel> list = [];
      final orderPath = await _getUserPath('orders.json');
      final response = await apiConsumer.get(path: orderPath);
      if (response.data == null) {
        throw NoDataException();
      }
      for (dynamic order in response.data.values) {
        list.add(OrderModel.fromJson(order));
      }
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    try {
      List<TransactionModel> list = [];
      final transactionPath = await _getUserPath('transactions.json');
      final response = await apiConsumer.get(path: transactionPath);
      if (response.data == null) {
        throw NoDataException();
      }
      for (dynamic transaction in response.data.values) {
        list.add(TransactionModel.fromJson(transaction));
      }
      return list;
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<UserModel> getUserData() async {
    try {
      final userPath = await _getUserPath('user_data.json');
      final response = await apiConsumer.get(path: userPath);
      return UserModel.fromJson(response);
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> setNotificationPreferences({
    required bool allowEmailNotifications,
    required bool allowOrderNotifications,
    required bool allowGeneralNotifications,
  }) async {
    final output = NotificationPreferencesModel(
      allowEmail: allowEmailNotifications,
      allowGeneral: allowGeneralNotifications,
      allowOrder: allowOrderNotifications,
    );
    try {
      final notificationPrefsPath = await _getUserPath(
        'notification_preferences.json',
      );
      await apiConsumer.patch(
        path: notificationPrefsPath,
        data: output.toJson(),
      );
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> updateAddress(AddressModel address) async {
    try {
      final addressPath = await _getUserPath('addresses/${address.id}.json');
      await apiConsumer.patch(path: addressPath, data: address.toJson());
    } on DioException {
      throw NoInternetException();
    }
  }

  @override
  Future<void> updateCreditCard(CreditCardModel card) async {
    try {
      final creditCardPath = await _getUserPath('credit_cards/${card.id}.json');
      await apiConsumer.patch(path: creditCardPath, data: card.toJson());
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
    final userPath = await _getUserPath('user_data.json');
    try {
      //first i check password correctness

      final response = await apiConsumer.get(path: userPath);
      UserModel tempUser = UserModel.fromJson(response);
      if (currentPassword == tempUser.password) {
        tempUser.name = name;
        tempUser.email = email;
        tempUser.number = phoneNumber;
        tempUser.password = newPassword1;
      } else {
        throw WrongPasswordException();
      }

      await apiConsumer.patch(path: userPath, data: tempUser.toJson());
    } on DioException {
      throw NoInternetException();
    }
  }
}
