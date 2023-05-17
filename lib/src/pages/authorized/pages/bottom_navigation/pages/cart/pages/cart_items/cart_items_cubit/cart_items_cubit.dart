import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'cart_items_callback.dart';

part 'cart_items_state.dart';

class CartItemsCubit extends Cubit<CartItemsState> {
  final CartItemsCallback _callback;

  CartItemsCubit({required CartItemsCallback callback})
      : _callback = callback,
        super(CartItemsInitial());

  void onOrder() => _callback.openOrder();
}
