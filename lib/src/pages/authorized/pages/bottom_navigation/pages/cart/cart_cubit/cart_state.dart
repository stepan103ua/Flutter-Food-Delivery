part of 'cart_cubit.dart';

class CartState extends Equatable with WithPageStack {
  const CartState({required this.pages});

  @override
  final List<AppPage> pages;

  @override
  withPagesStack(List<AppPage> pages) => CartState(pages: pages);

  @override
  List<Object?> get props => [pages];
}
