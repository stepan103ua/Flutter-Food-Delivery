import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/app_bloc/bloc/app_bloc.dart';
import 'package:food_delivery/app/view/app_view.dart';
import 'package:food_delivery/src/providers/dependencies_provider.dart';

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) => DependenciesProvider(
        child: BlocProvider(
          create: (context) =>
              AppBloc(firebaseAuth: RepositoryProvider.of(context)),
          child: const FoodDeliveryAppView(),
        ),
      );
}
