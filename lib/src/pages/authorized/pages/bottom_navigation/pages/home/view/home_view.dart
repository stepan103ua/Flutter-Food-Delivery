import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../navigation/navigation_router.dart';
import '../home_cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) =>
      NavigationRouter(navigationCubit: context.read<HomeCubit>());
}
