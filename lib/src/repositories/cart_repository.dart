import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/models/cart_item.dart';
import 'package:food_delivery/src/services/cart_service.dart';
import 'package:food_delivery/src/services/requests/cart_item_request.dart';

import '../services/slugify_service.dart';

class CartRepository {
  final CartService _service;
  final SlugifyService _slugify;

  CartRepository({
    required CartService service,
    required SlugifyService slugifyService,
  })  : _service = service,
        _slugify = slugifyService;

  Future<List<CartItem>> getCart() async {
    try {
      final items = await _service.getCart();
      return items.map((e) => e.toEntity()).toList();
    } on ApiError catch (_) {
      rethrow;
    }
  }

  Future<void> addItemToCart({
    required String productName,
    required int quantity,
  }) async {
    try {
      final request = CartItemRequest(
        productNameSlug: _slugify.slugify(productName),
        quantity: quantity,
      );

      return await _service.addItemsToCart(request);
    } on ApiError catch (_) {
      rethrow;
    }
  }

  Future<void> removeFromCart({
    required String productName,
    required int quantity,
  }) async {
    final request = CartItemRequest(
      productNameSlug: _slugify.slugify(productName),
      quantity: quantity,
    );

    return _service.removeFromCart(request);
  }
}
