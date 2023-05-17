import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/authorized_cubit/cubit/authorized_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/product_detail/product_detail_cubit/product_detail_cubit.dart';
import 'package:food_delivery/src/values/app_colors.dart';
import 'package:food_delivery/src/values/theme/theme.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.productName});

  final String productName;

  final String price = 'Price: ';
  final String addToCart = 'Add to cart';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            productName,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          state.product.image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      state.product.description,
                      style: Theme.of(context).textTheme.productDescription,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Text(
                              price,
                              style: Theme.of(context).textTheme.productPrice,
                            ),
                            Text(
                              '${state.product.price.ceil()} ₴',
                              style: Theme.of(context)
                                  .textTheme
                                  .productPriceNumber,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () => context
                            .read<AuthorizedCubit>()
                            .addCartItem(productName),
                        highlightColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: AppColors.green,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            addToCart,
                            style: Theme.of(context).textTheme.productAddToCart,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
