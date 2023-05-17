import 'package:food_delivery/src/services/order_service.dart';
import 'package:food_delivery/src/services/requests/create_order_request.dart';

class OrderRepository {
  final OrderService _service;

  OrderRepository({required OrderService service}) : _service = service;

  Future<void> createOrder(CreateOrderRequest request) =>
      _service.createOrder(request);
}
