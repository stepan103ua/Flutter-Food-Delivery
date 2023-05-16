import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/services/requests/login_request.dart';

import '../dao/auth_dao.dart';
import '../services/auth_service.dart';
import '../services/requests/register_request.dart';

class AuthRepository {
  final AuthService _service;
  final AuthDao _dao;

  AuthRepository({required AuthService service, required AuthDao dao})
      : _service = service,
        _dao = dao;

  Future<void> login(LoginRequest request) async {
    try {
      final response = await _service.login(request);

      await _dao.saveAccessToken(response.accessToken);
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }

  Future<void> register(RegisterRequest request) async {
    try {
      final response = await _service.register(request);

      await _dao.saveAccessToken(response.accessToken);
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }
}
