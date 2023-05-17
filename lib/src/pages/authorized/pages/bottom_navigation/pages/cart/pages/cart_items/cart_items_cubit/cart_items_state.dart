part of 'cart_items_cubit.dart';

abstract class CartItemsState extends Equatable {
  const CartItemsState();
}

class CartItemsInitial extends CartItemsState {
  @override
  List<Object> get props => [];
}
