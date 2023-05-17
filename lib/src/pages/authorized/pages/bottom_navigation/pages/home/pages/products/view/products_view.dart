import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/products/view/products_item.dart';
import 'package:food_delivery/src/values/app_colors.dart';

import 'package:food_delivery/src/widgets/app_text_field.dart';

import '../products_cubit/products_cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.categoryName});
  final String categoryName;
  final _searchIcon = const Icon(
    Icons.search,
    size: 30,
  );
  final _productsSearchInputHint = 'Search products';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            categoryName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          backgroundColor: AppColors.greenBackground,
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              AppTextField(
                hint: _productsSearchInputHint,
                onChanged: context.read<ProductsCubit>().onQueryChanged,
                suffixIcon: _searchIcon,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 350 / 190,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) => ProductItemWidget(
                      onProductDetailOpen: () => context
                          .read<ProductsCubit>()
                          .onProductDetailOpen(state.products[index].name),
                      product: state.products[index],
                    ),
                    itemCount: state.products.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
