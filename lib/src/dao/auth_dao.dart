import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthDao {
  final FlutterSecureStorage _storage;

  static const _accessTokenKey = 'accessToken';

  AuthDao({required FlutterSecureStorage storage}) : _storage = storage;

  Future<void> saveAccessToken(String token) =>
    _storage.write(key: _accessTokenKey, value: token);


  Future<String?> get accessToken => _storage.read(key: _accessTokenKey);
}
