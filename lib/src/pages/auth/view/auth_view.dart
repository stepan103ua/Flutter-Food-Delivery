import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/navigation/navigation_router.dart';
import 'package:food_delivery/src/pages/auth/auth_cubit/auth_cubit.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) =>
      NavigationRouter(navigationCubit: context.read<AuthCubit>());
}
