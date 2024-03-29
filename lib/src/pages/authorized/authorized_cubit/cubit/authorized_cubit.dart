import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/extensions/list_extension.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/models/cart_item.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/order/order_cubit/order_callback.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/view/bottom_navigation_page.dart';
import 'package:food_delivery/src/repositories/cart_repository.dart';

import 'authorized_callback.dart';

part 'authorized_state.dart';

class AuthorizedCubit extends NavigationCubit<AuthorizedState>
    implements AuthorizedAddCartItemCallback, OrderCallback {
  final CartRepository _cartRepository;

  AuthorizedCubit({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(
          AuthorizedState.initialPage(BottomNavigationPage.page()),
        ) {
    _loadCartItems();
  }

  void _loadCartItems() async {
    try {
      final cartItems = await _cartRepository.getCart();
      emit(state.updatedCartItems(cartItems));
    } on ApiError catch (error) {
      log(error.message);
      emit(state.updatedCartError(error.message));
    }
  }

  @override
  void addCartItem(String productName) async {
    final cartItems = [...state.cartItems];
    final index =
        cartItems.indexWhere((element) => element.productName == productName);

    if (index == -1) {
      try {
        await _cartRepository.addItemToCart(
          productName: productName,
          quantity: 1,
        );
        _loadCartItems();
      } on ApiError catch (error) {
        log(error.message);
        emit(state.updatedCartError(error.message));
      }

      return;
    }

    cartItems[index] = cartItems[index].copyWithIncreasedQuantity();

    emit(state.updatedCartItems(cartItems));

    _cartRepository.addItemToCart(
      productName: productName,
      quantity: cartItems[index].quantity,
    );
  }

  void removeCartItem(String productName) {
    final cartItems = [...state.cartItems];
    final index =
        cartItems.indexWhere((element) => element.productName == productName);

    if (index == -1) {
      return;
    }

    cartItems[index] = cartItems[index].copyWithDecreasedQuantity();

    if (cartItems[index].quantity == 0) {
      emit(state.updatedCartItems(cartItems - [cartItems[index]]));
      _cartRepository.removeFromCart(productName: productName, quantity: 0);
      return;
    }

    emit(state.updatedCartItems(cartItems));

    _cartRepository.addItemToCart(
      productName: productName,
      quantity: cartItems[index].quantity,
    );
  }

  @override
  onOrderCreated() => _loadCartItems();
}
