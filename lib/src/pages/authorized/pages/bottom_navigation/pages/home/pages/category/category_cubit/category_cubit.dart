import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/products/products_cubit/products_callback.dart';

import '../../../../../../../../../errors/api_error.dart';
import '../../../../../../../../../models/category.dart';
import '../models/categories_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ProductsCallback _productsCallback;
  final CategoriesRepository _categoriesRepository;

  CategoryCubit({
    required ProductsCallback callback,
    required CategoriesRepository categoriesRepository,
  })  : _categoriesRepository = categoriesRepository,
        _productsCallback = callback,
        super(const CategoriesInitial()) {
    _init();
  }

  void _init() async {
    try {
      final response = await _categoriesRepository.getCategories();
      emit(state.updatedCategories(response));
    } on ApiError catch (e) {
      emit(state.loadingError(e.toString()));
    }
  }

  void onQueryChanged(String query) async {
    try {
      final response = await _categoriesRepository.getCategoriesByQuery(query);
      emit(state.updatedCategories(response));
    } on ApiError catch (e) {
      emit(state.loadingError(e.toString()));
    }
  }

  void onCategoryOpen(Category category) {
    _productsCallback.onProductsOpen(category);
  }
}
