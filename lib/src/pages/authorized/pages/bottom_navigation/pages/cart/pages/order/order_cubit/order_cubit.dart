import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/models/validation_model.dart';
import 'package:food_delivery/src/repositories/cart_repository.dart';
import 'package:food_delivery/src/repositories/order_repository.dart';
import 'package:food_delivery/src/services/requests/create_order_request.dart';
import 'package:food_delivery/src/values/app_validation.dart';

import '../../cart_items/models/cart_item.dart';
import 'order_callback.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final CartRepository _cartRepository;
  final OrderRepository _repository;
  final OrderCallback _authorizedCallback;
  final OrderCallback _cartCallback;

  OrderCubit({
    required CartRepository cartRepository,
    required OrderRepository repository,
    required OrderCallback authorizedCallback,
    required OrderCallback cartCallback,
  })  : _cartRepository = cartRepository,
        _repository = repository,
        _authorizedCallback = authorizedCallback,
        _cartCallback = cartCallback,
        super(const OrderInitialLoading()) {
    _init();
  }

  void _init() async {
    try {
      final cartItems = await _cartRepository.getCart();

      emit(state.updatedProducts(cartItems));
    } catch (error) {
      emit(state.updatedProducts([]));
      log(error.toString());
    }
  }

  void onCityChanged(String? city) => emit(state.updatedCity(city));

  void onStreetChanged(String? street) => emit(state.updatedStreet(street));

  void onBuildingNumberChanged(String? buildingNumber) =>
      emit(state.updatedBuildingNumber(buildingNumber));

  void onPhoneNumberChanged(String? phoneNumber) =>
      emit(state.updatedPhoneNumber(phoneNumber));

  void onOrder() async {
    try {
      emit(state.validate());
      if(!state.isValid) {
        return;
      }
      final request = CreateOrderRequest(
        city: state.city.value,
        buildingNumber: state.buildingNumber.value,
        street: state.street.value,
        phoneNumber: state.phoneNumber.value,
      );
      emit(state.updatedCreatingOrder(true));
      await _repository.createOrder(request);
      _authorizedCallback.onOrderCreated();
      _cartCallback.onOrderCreated();
    } catch(_) {
      emit(state.updatedCreatingOrder(false));
    }
  }
}
