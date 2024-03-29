import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/home_cubit/home_cubit.dart';

import '../../../../../../../../../values/app_pages_names.dart';
import '../category_cubit/category_cubit.dart';
import '../models/categories_repository.dart';
import '../models/categories_service.dart';
import 'category_view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static AppPage page() => const AppPage(
        page: MaterialPage(
          child: CategoryPage(),
          key: ValueKey(AppPagesNames.category),
          name: AppPagesNames.category,
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => CategoryCubit(
          callback: context.read<HomeCubit>(),
          categoriesRepository: CategoriesRepository(
            categoriesService: CategoriesService(
              restClient: RepositoryProvider.of(context),
            ),
          ),
        ),
        child: const CategoryView(),
      );
}
