import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/app_bloc/bloc/app_bloc.dart';
import 'package:food_delivery/src/pages/splash_screen/models/splash_screen_repository.dart';
import 'package:food_delivery/src/pages/splash_screen/splash_screen_cubit/splash_screen_cubit.dart';
import '../../../values/app_pages_names.dart';
import 'splash_screen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  static Page page() => const MaterialPage(
        key: ValueKey(AppPagesNames.splashScreen),
        name: AppPagesNames.splashScreen,
        child: SplashScreenPage(),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => SplashScreenCubit(
          callback: context.read<AppBloc>(),
          repository: SplashScreenRepository(
            authDao: RepositoryProvider.of(context),
          ),
        ),
        child: const SplashScreenView(),
      );
}
