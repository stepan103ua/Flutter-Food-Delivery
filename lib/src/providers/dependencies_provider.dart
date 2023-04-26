import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_delivery/src/dao/auth_dao.dart';
import 'package:food_delivery/src/repositories/auth_repository.dart';
import 'package:food_delivery/src/services/auth_service.dart';

class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) =>
                BaseOptions(baseUrl: 'http://localhost:8000/api'),
          ),
          RepositoryProvider(
            create: (context) => Dio(RepositoryProvider.of(context)),
          ),
          RepositoryProvider(create: (context) => const FlutterSecureStorage()),
          RepositoryProvider(
            create: (context) =>
                AuthService(dio: RepositoryProvider.of(context)),
          ),
          RepositoryProvider(
            create: (context) =>
                AuthDao(storage: RepositoryProvider.of(context)),
          ),
          RepositoryProvider(
            create: (context) => AuthRepository(
              service: RepositoryProvider.of(context),
              dao: RepositoryProvider.of(context),
            ),
          ),
        ],
        child: child,
      );
}
