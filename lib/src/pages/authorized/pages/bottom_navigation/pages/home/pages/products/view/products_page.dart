import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../models/category.dart';
import '../../../../../../../../../navigation/navigation.dart';
import '../../../../../../../../../values/app_pages_names.dart';
import '../models/products_repository.dart';
import '../models/products_service.dart';
import '../products_cubit/products_cubit.dart';
import 'products_view.dart';

class ProductsPage extends StatelessWidget {
  final Category category;
  const ProductsPage({required this.category, super.key});

  static AppPage page(Category category) => AppPage(
        page: CupertinoPage(
          child: ProductsPage(category: category),
          key: const ValueKey(AppPagesNames.products),
          name: AppPagesNames.products,
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ProductsCubit(
          category: category.name,
          productsRepository: ProductsRepository(
            service: ProductsService(
              restClient: RepositoryProvider.of(context),
            ),
          ),
        ),
        child: ProductsView(
          categoryName: category.name,
        ),
      );
}
