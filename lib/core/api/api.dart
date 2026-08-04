import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ApiConsumer {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> put({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> patch({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> delete({required String path});
}

@LazySingleton(as: ApiConsumer)
class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});

  @override
  Future<dynamic> delete({required String path}) async {
    final response = await dio.delete(path);
    return response;
  }

  @override
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    return response;
  }

  @override
  Future<dynamic> patch({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.patch(
      path,
      queryParameters: queryParameters,
      data: data,
    );
    return response;
  }

  @override
  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post(
      path,
      queryParameters: queryParameters,
      data: data,
    );
    return response;
  }

  //put is like post but at a specific lcation
  @override
  Future<dynamic> put({
    required String path,
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.put(
      path,
      queryParameters: queryParameters,
      data: data,
    );
    return response;
  }
}
