import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/view/cart_items_page.dart';

part 'cart_state.dart';

class CartCubit extends NavigationCubit<CartState> {
  CartCubit() : super(CartState(pages: [CartItemsPage.page()]));
}
