import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../navigation/navigation.dart';
import '../../../../../values/app_pages_names.dart';
import '../category_cubit/category_cubit.dart';
import 'category_view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  static page() => MaterialPage(
        key: ValueKey(AppPagesNames.category),
        name: AppPagesNames.category,
        child: CategoryPage(),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => CategoryCubit(),
        child: const CategoryView(),
      );
}
