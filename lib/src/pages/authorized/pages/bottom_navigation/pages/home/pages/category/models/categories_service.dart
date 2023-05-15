import 'package:food_delivery/src/services/rest_client.dart';

import '../../../../../../../../../errors/api_error.dart';
import '../../../../../../../../../models/category.dart';

class CategoriesService {
  final RestClient _restClient;
  CategoriesService({required RestClient restClient})
      : _restClient = restClient;

  Future<List<Category>> getCategories() async {
    try {
      final response = await _restClient.get(endpoint: '/categories');
      return (response.data as List).map(Category.fromJson).toList();
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }

  Future<List<Category>> getCategoriesByQuery(String query) async {
    try {
      final response = await _restClient
          .get(endpoint: '/categories', queryParameters: {'search': query});
      final categories =
          (response.data as List).map(Category.fromJson).toList();
      return categories;
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }
}
