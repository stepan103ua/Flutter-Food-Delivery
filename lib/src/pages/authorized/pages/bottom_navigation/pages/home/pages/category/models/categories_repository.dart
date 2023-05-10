import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/models/category.dart';
import 'categories_service.dart';

class CategoriesRepository {
  final CategoriesService _categoriesService;

  CategoriesRepository({
    required CategoriesService categoriesService,
  }) : _categoriesService = categoriesService;

  Future<List<Category>> getCategories() async {
    try {
      final response = await _categoriesService.getCategories();
      return response;
    } on ApiError catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Category>> getCategoriesByQuery(String query) async {
    try {
      final response = await _categoriesService.getCategoriesByQuery(query);
      return response;
    } on ApiError catch (e) {
      return Future.error(e);
    }
  }
}
