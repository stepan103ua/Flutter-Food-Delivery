import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/auth/auth_cubit/auth_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/splash_screen/splash_screen_cubit/splash_screen_cubit.dart';

import '../../../../../navigation/navigation.dart';
import '../../../../../values/app_pages_names.dart';
import 'splash_screen.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  static AppPage page() => const AppPage(
        page: MaterialPage(
          key: ValueKey(AppPagesNames.splashScreen),
          name: AppPagesNames.splashScreen,
          child: SplashScreenPage(),
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => SplashScreenCubit(callback: context.read<AuthCubit>()),
        child: const SplashScreenView(),
      );
}
