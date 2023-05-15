import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/values/app_constants.dart';
import 'package:food_delivery/src/values/theme/theme.dart';
import 'package:food_delivery/src/widgets/app_text_field.dart';
import 'package:food_delivery/src/widgets/category_item_widget.dart';

import '../category_cubit/category_cubit.dart';

class CategoryView extends StatelessWidget {
  final _searchIcon = const Icon(
    Icons.search,
    size: 30,
  );
  final String _categorySearchInputHint = 'Search category';
  const CategoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appName,
                  style: Theme.of(context).textTheme.logoTitleMedium,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  hint: _categorySearchInputHint,
                  onChanged: context.read<CategoryCubit>().onQueryChanged,
                  suffixIcon: _searchIcon,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 150 / 190,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) => CategoryItemWidget(
                        onTap: () => context
                            .read<CategoryCubit>()
                            .onCategoryOpen(state.categories[index]),
                        categoryName: state.categories[index].name,
                        imageUrl: state.categories[index].imageUrl,
                      ),
                      itemCount: state.categories.length,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
