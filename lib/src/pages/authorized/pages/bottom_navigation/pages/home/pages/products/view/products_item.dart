import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';

import '../models/product.dart';

class ProductItemWidget extends StatelessWidget {
  final VoidCallback onProductDetailOpen;
  final Product _product;
  const ProductItemWidget({
    required Product product,
    super.key,
    required this.onProductDetailOpen,
  }) : _product = product;

  @override
  Widget build(BuildContext context) => InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: onProductDetailOpen,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                _product.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      color: AppColors.green,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '${_product.price} ₴',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: AppColors.green,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      _product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: AppColors.green,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      'More ->',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
