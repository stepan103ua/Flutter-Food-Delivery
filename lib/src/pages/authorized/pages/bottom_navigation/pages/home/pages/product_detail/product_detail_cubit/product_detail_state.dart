part of 'product_detail_cubit.dart';

abstract class ProductDetailState extends Equatable {
  final Product product;
  const ProductDetailState({required this.product});

  ProductDetailState productLoaded({required Product product}) =>
      ProductDetailLoaded(product: product);
  ProductDetailState productError({
    required Product product,
    required String errorMessage,
  }) =>
      ProductDetailError(product: product, errorMessage: errorMessage);

  @override
  List<Object> get props => [product];
}

class ProductDetailLoaded extends ProductDetailState {
  const ProductDetailLoaded({required super.product});
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial({required super.product});
}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading({required super.product});
}

class ProductDetailError extends ProductDetailState {
  final String errorMessage;
  const ProductDetailError({
    required this.errorMessage,
    required super.product,
  });
}
