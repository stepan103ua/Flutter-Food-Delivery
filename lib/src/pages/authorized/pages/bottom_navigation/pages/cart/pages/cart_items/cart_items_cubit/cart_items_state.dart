part of 'cart_items_cubit.dart';

abstract class CartItemsState extends Equatable {
  final List<CartItem> items;
  final String? errorMessage;

  const CartItemsState({required this.items, required this.errorMessage});

  String get totalPriceString => items
      .fold(
        0.0,
        (previousValue, element) => previousValue + element.totalPrice,
      )
      .toStringAsFixed(2);

  CartItemsState updatedCartItems(List<CartItem> items) =>
      CartItemsUpdated(items: items, errorMessage: errorMessage);

  CartItemsState updatedErrorMessage(String errorMessage) =>
      CartItemsError(items: items, errorMessage: errorMessage);

  @override
  List<Object> get props => [items];
}

class CartItemsInitial extends CartItemsState {
  const CartItemsInitial({super.items = const [], super.errorMessage});
}

class CartItemsUpdated extends CartItemsState {
  const CartItemsUpdated({required super.items, required super.errorMessage});
}

class CartItemsError extends CartItemsState {
  const CartItemsError({required super.items, required super.errorMessage});
}
