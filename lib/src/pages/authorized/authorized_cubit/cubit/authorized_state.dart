part of 'authorized_cubit.dart';

class AuthorizedState extends Equatable with WithPageStack {
  final List<CartItem> cartItems;
  final String? cartError;

  const AuthorizedState({
    required this.pages,
    required this.cartItems,
    required this.cartError,
  });

  factory AuthorizedState.initialPage(AppPage initialPage) => AuthorizedState(
        pages: [initialPage],
        cartItems: const [],
        cartError: null,
      );

  @override
  final List<AppPage> pages;

  @override
  withPagesStack(List<AppPage> pages) => AuthorizedState(
        pages: pages,
        cartItems: cartItems,
        cartError: cartError,
      );

  String get totalPriceString => cartItems
      .fold(
        0.0,
        (previousValue, element) => previousValue + element.totalPrice,
      )
      .toStringAsFixed(2);

  AuthorizedState updatedCartItems(List<CartItem> items) => AuthorizedState(
        cartItems: items,
        pages: pages,
        cartError: cartError,
      );

  AuthorizedState updatedCartError(String error) => AuthorizedState(
        cartItems: cartItems,
        pages: pages,
        cartError: error,
      );

  @override
  List<Object?> get props => [pages, cartItems, cartError];
}
