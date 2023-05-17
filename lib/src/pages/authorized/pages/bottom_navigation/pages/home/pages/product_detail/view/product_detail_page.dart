import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../navigation/navigation.dart';
import '../../../../../../../../../values/app_pages_names.dart';
import '../models/product_detail_repository.dart';
import '../models/product_detail_service.dart';
import '../product_detail_cubit/product_detail_cubit.dart';
import 'product_detail_view.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.productName});

  final String productName;

  static AppPage page(String productName) => AppPage(
        page: CupertinoPage(
          child: ProductDetailPage(productName: productName),
          key: const ValueKey(AppPagesNames.productDetail),
          name: AppPagesNames.productDetail,
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ProductDetailCubit(
          productName: productName,
          productDetailRepository: ProductDetailRepository(
            productDetailService: ProductDetailService(
              restClient: context.read(),
            ),
          ),
        ),
        child: ProductDetailView(productName: productName),
      );
}
