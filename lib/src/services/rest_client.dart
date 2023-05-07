import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_delivery/src/errors/api_error.dart';

import '../dao/auth_dao.dart';

class RestClient {
  final Dio _dio;
  final AuthDao _authDao;

  RestClient({required Dio dio, required AuthDao authDao})
      : _dio = dio,
        _authDao = authDao;

  Future<Dio> get _client async {
    _dio.options = BaseOptions(
      baseUrl: 'http://192.168.0.105:8000/api',
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final accessToken = await _authDao.accessToken;

    if (accessToken == null) {
      return _dio;
    }

    _dio.options.headers
        .putIfAbsent('Authorization', () => 'Bearer $accessToken');

    return _dio;
  }

  Future<Response> post({
    Object? body,
    Map<String, dynamic>? queryParameters,
    required String endpoint,
  }) async {
    try {
      final client = await _client;
      return await client.post(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } on DioError catch (error) {
      return Future.error(ApiError(error));
    } catch (error) {
      log(error.toString(), name: 'Unexpected error: $runtimeType');
      return Future.error(ApiError());
    }
  }

  Future<Response> get({
    Object? body,
    Map<String, dynamic>? queryParameters,
    required String endpoint,
  }) async {
    try {
      final client = await _client;

      return client.get(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } on DioError catch (error) {
      return Future.error(ApiError(error));
    } catch (error) {
      log(error.toString(), name: 'Unexpected error: $runtimeType');
      return Future.error(ApiError());
    }
  }

  Future<Response> delete({
    Object? body,
    Map<String, dynamic>? queryParameters,
    required String endpoint,
  }) async {
    try {
      final client = await _client;

      return client.delete(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } on DioError catch (error) {
      return Future.error(ApiError(error));
    } catch (error) {
      log(error.toString(), name: 'Unexpected error: $runtimeType');
      return Future.error(ApiError());
    }
  }

  Future<Response> put({
    Object? body,
    Map<String, dynamic>? queryParameters,
    required String endpoint,
  }) async {
    try {
      final client = await _client;

      return client.put(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } on DioError catch (error) {
      return Future.error(ApiError(error));
    } catch (error) {
      log(error.toString(), name: 'Unexpected error: $runtimeType');
      return Future.error(ApiError());
    }
  }
}
