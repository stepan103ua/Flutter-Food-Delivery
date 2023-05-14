import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/models/cart_item.dart';

import '../../../../../../../../../repositories/cart_repository.dart';

part 'cart_items_state.dart';

class CartItemsCubit extends Cubit<CartItemsState> {
  final CartRepository _cartRepository;

  CartItemsCubit({
    required CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const CartItemsInitial()) {
    _init();
  }

  void _init() async {
    try {
      final cartItems = await _cartRepository.getCart();
      emit(state.updatedCartItems(cartItems));
    } on ApiError catch(error) {
      emit(state.updatedErrorMessage(error.message));
    }
  }
}
