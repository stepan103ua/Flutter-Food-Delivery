import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/category/category_cubit/category_callback.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/product_detail/product_detail_cubit/product_detail_callback.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/products/view/products_page.dart';

import '../../../../../../../models/category.dart';
import '../../../../../../../navigation/navigation.dart';
import '../pages/category/view/category_page.dart';
import '../pages/product_detail/view/product_detail_page.dart';
import '../pages/products/products_cubit/products_callback.dart';

part 'home_state.dart';

class HomeCubit extends NavigationCubit<HomeState>
    implements ProductsCallback, CategoryCallback, ProductDetailCallback {
  HomeCubit() : super(HomeState(pages: [CategoryPage.page()]));

  @override
  void onProductsOpen(Category category) {
    emit(state.pushPage(ProductsPage.page(category)));
  }

  @override
  void onCategoryBack() {
    emit(state.pop());
  }

  @override
  void onProductDetailOpen(String productName) {
    emit(state.pushPage(ProductDetailPage.page(productName)));
  }
}
