import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/services/requests/register_request.dart';
import 'package:food_delivery/src/services/rest_client.dart';
import 'requests/login_request.dart';

import 'responses/auth_response.dart';

class AuthService {
  final RestClient _restClient;

  AuthService({required RestClient restClient}) : _restClient = restClient;

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response =
          await _restClient.post(endpoint: 'http://192.168.0.105:8000/api/login', body: request.toJson());
      return AuthResponse.fromJson(response.data);
    } on ApiError catch (_) {
      rethrow;
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response =
          await _restClient.post(endpoint: '/register', body: request.toJson());
      return AuthResponse.fromJson(response.data);
    } on ApiError catch(_) {
      rethrow;
    }
  }
}
