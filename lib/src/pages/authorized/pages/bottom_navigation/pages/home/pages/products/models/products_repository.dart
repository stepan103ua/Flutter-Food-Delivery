import 'package:food_delivery/src/errors/api_error.dart';

import 'product.dart';
import 'products_service.dart';

class ProductsRepository {
  final ProductsService _productsService;

  ProductsRepository({required ProductsService service})
      : _productsService = service;

  Future<List<Product>> getProducts(String category) async {
    try {
      return await _productsService.getProducts(category);
    } on ApiError catch (e) {
      return Future.error(e);
    }
  }

  Future<List<Product>> getProductsByQuery(String query) async {
    try {
      return await _productsService.getProductsByQuery(query);
    } on ApiError catch (e) {
      return Future.error(e);
    }
  }
}
