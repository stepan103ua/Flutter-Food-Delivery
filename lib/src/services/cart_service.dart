import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/models/cart_item_model.dart';
import 'package:food_delivery/src/services/requests/cart_item_request.dart';
import 'package:food_delivery/src/services/rest_client.dart';

class CartService {
  final RestClient _client;

  CartService({required RestClient client}) : _client = client;

  Future<List<CartItemModel>> getCart() async {
    try {
      final response = await _client.get(endpoint: '/cart');
      return (response.data as List)
          .map(CartItemModel.fromJson)
          .toList();
    } on ApiError catch (_) {
      rethrow;
    }
  }

  Future<void> addItemsToCart(CartItemRequest request) async {
    try {
      await _client.post(
        endpoint: '/cart/',
        body: request.toJson(),
      );
    } on ApiError catch (_) {
      rethrow;
    }
  }

  Future<void> removeFromCart(CartItemRequest request) async {
    try {
      await _client.delete(
        endpoint: '/cart/',
        body: request.toJson(),
      );
    } on ApiError catch (_) {
      rethrow;
    }
  }
}
