import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/pages/auth/auth_cubit/auth_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/login/login_cubit/login_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/login/view/login_view.dart';
import 'package:food_delivery/src/values/app_pages_names.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static AppPage page() => const AppPage(
        page: CupertinoPage(
          key: ValueKey(AppPagesNames.login),
          name: AppPagesNames.login,
          child: LoginPage(),
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => LoginCubit(callback: context.read<AuthCubit>()),
        child: const LoginView(),
      );
}
