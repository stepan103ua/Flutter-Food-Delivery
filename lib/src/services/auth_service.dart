import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/services/requests/register_request.dart';
import 'requests/login_request.dart';

import 'responses/auth_response.dart';

class AuthService {
  final Dio _dio;

  AuthService({required Dio dio}): _dio = dio;

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post('/login', data: request.toJson());
      return AuthResponse.fromJson(response.data);
    } on DioError catch(error) {
      return Future.error(ApiError(error));
    } catch(e) {
      log(e.toString(), name: e.runtimeType.toString());
      return Future.error(ApiError());
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post('/users', data: request.toJson());
      return AuthResponse.fromJson(response.data);
    } on DioError catch(error) {
      return Future.error(ApiError(error));
    } catch(e) {
      log(e.toString(), name: e.runtimeType.toString());
      return Future.error(ApiError());
    }
  }
}