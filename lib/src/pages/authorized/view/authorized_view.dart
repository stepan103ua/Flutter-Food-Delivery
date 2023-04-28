import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/navigation/navigation_router.dart';
import 'package:food_delivery/src/pages/authorized/authorized_cubit/cubit/authorized_cubit.dart';

class AuthorizedView extends StatelessWidget {
  const AuthorizedView({super.key});

  @override
  Widget build(BuildContext context) =>
      NavigationRouter(navigationCubit: context.read<AuthorizedCubit>());
}
