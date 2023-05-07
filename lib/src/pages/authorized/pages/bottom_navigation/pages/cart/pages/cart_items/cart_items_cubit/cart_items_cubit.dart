import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_items_state.dart';

class CartItemsCubit extends Cubit<CartItemsState> {
  CartItemsCubit() : super(CartItemsInitial());
}
