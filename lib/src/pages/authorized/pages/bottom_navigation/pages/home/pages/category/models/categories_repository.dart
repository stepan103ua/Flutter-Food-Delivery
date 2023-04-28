import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/category/models/responses/categories_response.dart';

import 'categories_service.dart';

class CategoriesRepository {
  final CategoriesService _categoriesService;

  CategoriesRepository({required CategoriesService categoriesService})
      : _categoriesService = categoriesService;

  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _categoriesService.getCategories();
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<CategoriesResponse> getCategoriesByQuery(String query) async {
    try {
      final response = await _categoriesService.getCategoriesByQuery(query);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
