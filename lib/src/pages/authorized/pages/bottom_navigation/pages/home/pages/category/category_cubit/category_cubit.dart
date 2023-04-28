import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../../../models/category.dart';
import '../models/categories_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoriesRepository _categoriesRepository;

  CategoryCubit({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(const CategoriesInitial());

  Future<void> getCategories() async {
    try {
      final response = await _categoriesRepository.getCategories();
      emit(state.updatedCategories(response.categories));
    } catch (e) {
      emit(state.loadingError(e.toString()));
    }
  }

  Future<void> getCategoriesByQuery(String query) async {
    try {
      final response = await _categoriesRepository.getCategoriesByQuery(query);
      emit(state.updatedCategories(response.categories));
    } catch (e) {
      emit(state.loadingError(e.toString()));
    }
  }
}
