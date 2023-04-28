import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_constants.dart';
import 'package:food_delivery/src/values/theme.dart';
import 'package:food_delivery/src/widgets/app_text_field.dart';
import 'package:food_delivery/src/widgets/category_item_widget.dart';

class CategoryView extends StatelessWidget {
  final _searchIcon = const Icon(
    Icons.search,
    size: 30,
  );
  final _categorySearchInputHint = 'Search category';
  const CategoryView({super.key});

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
                  onChanged: (value) {},
                  suffixIcon: _searchIcon,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 150 / 190,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) => CategoryItemWidget(
                      onTap: () {},
                      categoryName: 'Burgers',
                      imageUrl: 'assets/images/burger.png',
                    ),
                    itemCount: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}