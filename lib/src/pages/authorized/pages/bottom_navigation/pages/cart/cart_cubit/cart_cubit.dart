import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/cart_items_cubit/cart_items_callback.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/view/cart_items_page.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/order/view/order_page.dart';

import '../pages/order/order_cubit/order_callback.dart';

part 'cart_state.dart';

class CartCubit extends NavigationCubit<CartState> implements CartItemsCallback, OrderCallback {
  CartCubit() : super(CartState(pages: [CartItemsPage.page()]));

  @override
  openOrder() => emit(state.pushPage(OrderPage.page()));

  @override
  onOrderCreated() => emit(state.pop());
}
