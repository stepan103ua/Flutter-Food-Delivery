import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/authorized_cubit/cubit/authorized_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/models/cart_item.dart';
import 'package:food_delivery/src/values/app_colors.dart';

class CartListItem extends StatelessWidget {
  final CartItem item;

  const CartListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Container(
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 5,
                offset: Offset(0, 5),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        item.productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(10),
                      ),
                      child: Image.network(
                        item.imageUrl,
                        width: constraints.maxWidth * 0.4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: 'Price per one: ',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.green,
                          ),
                          children: [
                            TextSpan(
                              text: '${item.productPrice} ₴',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _QuantityCounter(
                        quantity: item.quantity,
                        onAdd: () => context
                            .read<AuthorizedCubit>()
                            .addCartItem(item.productName),
                        onRemove: () => context
                            .read<AuthorizedCubit>()
                            .removeCartItem(item.productName),
                      ),
                    ),
                    _TotalPrice(totalPrice: item.totalPrice),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

class _QuantityCounter extends StatelessWidget {
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onAdd;

  const _QuantityCounter({
    required this.quantity,
    required this.onRemove,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.green,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onRemove,
              icon: const Icon(
                Icons.remove,
                size: 30,
                color: AppColors.green,
              ),
            ),
            Expanded(
              child: Text(
                quantity.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.green,
                ),
              ),
            ),
            IconButton(
              onPressed: onAdd,
              icon: const Icon(
                Icons.add,
                size: 30,
                color: AppColors.white,
              ),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.green,
              ),
            ),
          ],
        ),
      );
}

class _TotalPrice extends StatelessWidget {
  final double totalPrice;

  const _TotalPrice({required this.totalPrice});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: 'Total: ',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
            children: [
              TextSpan(
                text: '$totalPrice ₴',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
}
