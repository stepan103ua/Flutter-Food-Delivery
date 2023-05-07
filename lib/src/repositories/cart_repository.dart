import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/models/cart_item_model.dart';
import 'package:food_delivery/src/services/cart_service.dart';
import 'package:food_delivery/src/services/requests/add_item_to_cart_request.dart';

import '../services/slugify_service.dart';

class CartRepository {
  final CartService _service;
  final SlugifyService _slugify;

  CartRepository({
    required CartService service,
    required SlugifyService slugifyService,
  })  : _service = service,
        _slugify = slugifyService;

  Future<List<CartItemModel>> getCart() async {
    try {
      return await _service.getCart();
    } on ApiError catch (_) {
      rethrow;
    }
  }

  Future<void> addItemToCart({
    required String productName,
    required int quantity,
  }) async {
    try {
      final request = AddItemsToCartRequest(
        productNameSlug: _slugify.slugify(productName),
        quantity: quantity,
      );

      return await _service.addItemsToCart(request);
    } on ApiError catch (_) {
      rethrow;
    }
  }
}
