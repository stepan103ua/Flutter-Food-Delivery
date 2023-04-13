import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/auth/auth_cubit/auth_cubit.dart';
import 'package:food_delivery/src/pages/auth/view/auth_view.dart';
import 'package:food_delivery/src/values/app_pages_names.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static Page page() => const CupertinoPage(
        key: ValueKey(AppPagesNames.auth),
        name: AppPagesNames.auth,
        child: AuthPage(),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => AuthCubit(),
        child: const AuthView(),
      );
}
