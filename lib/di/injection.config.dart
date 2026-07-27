// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:big_cart/core/api/api.dart' as _i1010;
import 'package:big_cart/core/network/network_info.dart' as _i1004;
import 'package:big_cart/di/injection.dart' as _i934;
import 'package:big_cart/features/auth/data/data_sources/auth_local_data_source.dart'
    as _i793;
import 'package:big_cart/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i135;
import 'package:big_cart/features/auth/data/repositories/auth_repository_impl.dart'
    as _i731;
import 'package:big_cart/features/auth/domain/repositories/auth_repository.dart'
    as _i832;
import 'package:big_cart/features/auth/domain/use%20cases/cache_user.dart'
    as _i290;
import 'package:big_cart/features/auth/domain/use%20cases/forgot_password.dart'
    as _i211;
import 'package:big_cart/features/auth/domain/use%20cases/get_cached_user.dart'
    as _i1036;
import 'package:big_cart/features/auth/domain/use%20cases/log_in.dart' as _i270;
import 'package:big_cart/features/auth/domain/use%20cases/send_otp.dart'
    as _i491;
import 'package:big_cart/features/auth/domain/use%20cases/sign_up.dart'
    as _i357;
import 'package:big_cart/features/auth/domain/use%20cases/verify_otp.dart'
    as _i210;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i1010.ApiConsumer>(
      () => _i1010.DioConsumer(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1004.NetworkInfo>(
      () => _i1004.NetworkInfoImpl(
        internetConnectionChecker: gh<_i973.InternetConnectionChecker>(),
      ),
    );
    gh.lazySingleton<_i793.AuthLocalDataSource>(
      () => _i793.AuthLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i135.AuthRemoteDataSource>(
      () =>
          _i135.AuthRemoteDataSourceImpl(apiConsumer: gh<_i1010.ApiConsumer>()),
    );
    gh.lazySingleton<_i832.AuthRepository>(
      () => _i731.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i135.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i793.AuthLocalDataSource>(),
        networkInfo: gh<_i1004.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i211.ForgotPassword>(
      () => _i211.ForgotPassword(repository: gh<_i832.AuthRepository>()),
    );
    gh.lazySingleton<_i1036.GetCachedUser>(
      () => _i1036.GetCachedUser(repository: gh<_i832.AuthRepository>()),
    );
    gh.lazySingleton<_i491.SendOtp>(
      () => _i491.SendOtp(repository: gh<_i832.AuthRepository>()),
    );
    gh.lazySingleton<_i357.SignUp>(
      () => _i357.SignUp(repository: gh<_i832.AuthRepository>()),
    );
    gh.lazySingleton<_i210.VerifyOtp>(
      () => _i210.VerifyOtp(repository: gh<_i832.AuthRepository>()),
    );
    gh.lazySingleton<_i290.CacheUser>(
      () => _i290.CacheUser(gh<_i832.AuthRepository>()),
    );
    gh.lazySingleton<_i270.LogIn>(
      () => _i270.LogIn(authRepository: gh<_i832.AuthRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i934.RegisterModule {}
