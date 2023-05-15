import 'package:food_delivery/src/services/rest_client.dart';

import '../../../../../../../../../errors/api_error.dart';
import 'product.dart';

class ProductsService {
  final RestClient _restClient;

  ProductsService({required RestClient restClient}) : _restClient = restClient;

  Future<List<Product>> getProducts(String category) async {
    try {
      final response = await _restClient
          .get(endpoint: '/products', queryParameters: {'category': category});
      return (response.data as List).map(Product.fromJson).toList();
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }

  Future<List<Product>> getProductsByQuery(String query) async {
    try {
      final response = await _restClient
          .get(endpoint: '/products', queryParameters: {'search': query});
      final products = (response.data as List).map(Product.fromJson).toList();
      return products;
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }
}
