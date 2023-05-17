import 'package:food_delivery/src/services/requests/create_order_request.dart';
import 'package:food_delivery/src/services/rest_client.dart';

class OrderService {
  final RestClient _client;

  OrderService({required RestClient client}) : _client = client;

  Future<void> createOrder(CreateOrderRequest request) =>
      _client.post(endpoint: '/order/', body: request.toJson());
}
