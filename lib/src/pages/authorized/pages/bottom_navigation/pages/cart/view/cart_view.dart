import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/navigation/navigation_router.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/cart_cubit/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) =>
      NavigationRouter(navigationCubit: context.read<CartCubit>());
}
