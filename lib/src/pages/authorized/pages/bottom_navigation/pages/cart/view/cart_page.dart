import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/cart_cubit/cart_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/view/cart_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => CartCubit(),
        child: const CartView(),
      );
}
