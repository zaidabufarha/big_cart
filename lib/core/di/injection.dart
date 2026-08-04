import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl:
          'https://bigcart-30ded-default-rtdb.asia-southeast1.firebasedatabase.app/',
    ),
  );

  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker.instance;

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
