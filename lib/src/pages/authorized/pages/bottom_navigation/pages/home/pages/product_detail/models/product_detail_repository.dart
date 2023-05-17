import 'package:food_delivery/src/errors/api_error.dart';

import '../../products/models/product.dart';
import 'product_detail_service.dart';

class ProductDetailRepository {
  final ProductDetailService _productDetailService;
  ProductDetailRepository({required ProductDetailService productDetailService})
      : _productDetailService = productDetailService;

  Future<Product> getProductDetail(String name) async {
    try {
      final response = await _productDetailService.getProductDetail(name);
      return response;
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }
}
