import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/home_cubit/home_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeView(),
      );
}
