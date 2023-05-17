import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_delivery/src/dao/auth_dao.dart';
import 'package:food_delivery/src/repositories/auth_repository.dart';
import 'package:food_delivery/src/repositories/cart_repository.dart';
import 'package:food_delivery/src/services/auth_service.dart';
import 'package:food_delivery/src/services/cart_service.dart';
import 'package:food_delivery/src/services/rest_client.dart';
import 'package:food_delivery/src/services/slugify_service.dart';

class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => Dio(),
          ),
          RepositoryProvider(
            create: (context) => const FlutterSecureStorage(),
          ),
          RepositoryProvider(
            create: (context) => SlugifyService(),
          ),
          RepositoryProvider(
            create: (context) =>
                AuthDao(storage: RepositoryProvider.of(context)),
          ),
          RepositoryProvider(
            create: (context) => RestClient(
              dio: RepositoryProvider.of(context),
              authDao: RepositoryProvider.of(context),
            ),
          ),
          RepositoryProvider(
            create: (context) =>
                AuthService(restClient: RepositoryProvider.of(context)),
          ),
          RepositoryProvider(
            create: (context) =>
                CartService(client: RepositoryProvider.of(context)),
          ),
          RepositoryProvider(
            create: (context) => AuthRepository(
              service: RepositoryProvider.of(context),
              dao: RepositoryProvider.of(context),
            ),
          ),
          RepositoryProvider(
            create: (context) => CartRepository(
              service: RepositoryProvider.of(context),
              slugifyService: RepositoryProvider.of(context),
            ),
          ),
        ],
        child: child,
      );
}
