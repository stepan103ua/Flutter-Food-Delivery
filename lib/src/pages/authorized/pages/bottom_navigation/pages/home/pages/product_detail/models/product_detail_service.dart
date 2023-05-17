import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/products/models/product.dart';
import 'package:food_delivery/src/services/rest_client.dart';

class ProductDetailService {
  final RestClient _restClient;
  ProductDetailService({required RestClient restClient})
      : _restClient = restClient;

  Future<Product> getProductDetail(String name) async {
    try {
      final formattedName = name.replaceAll(' ', '-');
      final response =
          await _restClient.get(endpoint: '/products/$formattedName');
      return Product.fromJson(response.data[0]);
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }
}
