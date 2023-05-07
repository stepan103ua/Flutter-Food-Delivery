import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/cart_items_cubit/cart_items_cubit.dart';

class CartItemsView extends StatelessWidget {
  const CartItemsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Your cart'),),
        body: BlocBuilder<CartItemsCubit, CartItemsState>(
          builder: (context, state) => Column(
            children: [
             
            ],
          ),
        ),
      );
}
