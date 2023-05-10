import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/app_bloc/bloc/app_bloc.dart';
import 'package:food_delivery/src/pages/auth/auth_cubit/auth_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/register/models/cities_service.dart';
import 'package:food_delivery/src/pages/auth/pages/register/models/register_repository.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_cubit.dart';

import '../../../../../navigation/navigation.dart';
import '../../../../../values/app_pages_names.dart';
import 'register_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static AppPage page() => const AppPage(
        page: CupertinoPage(
          key: ValueKey(AppPagesNames.register),
          name: AppPagesNames.register,
          child: RegisterPage(),
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RegisterCubit(
          callback: context.read<AuthCubit>(),
          repository: RegisterRepository(citiesService: CitiesService()),
          authCallback: context.read<AppBloc>(),
          authRepository: RepositoryProvider.of(context),
        ),
        child: const RegisterView(),
      );
}
