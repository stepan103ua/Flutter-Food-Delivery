import 'package:food_delivery/src/dao/auth_dao.dart';
import 'package:food_delivery/src/pages/splash_screen/models/initialization_result.dart';

class SplashScreenRepository {
  final AuthDao _authDao;

  SplashScreenRepository({required AuthDao authDao}) : _authDao = authDao;

  Future<InitializationResult> get isAuthorized async {
    final accessToken = await _authDao.accessToken;

    return accessToken == null
        ? InitializationResult.notAuthorized
        : InitializationResult.authorized;
  }
}
