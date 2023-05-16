part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState({
    required this.products,
  });

  final List<Product> products;

  ProductsState updatedProducts(List<Product> products) => ProductsUpdated(
        products: products,
      );

  ProductsState loadingError(String error) => ProductsLoadingError(
        errorMessage: error,
        products: products,
      );

  @override
  List<Object> get props => [products];
}

class ProductsInitial extends ProductsState {
  const ProductsInitial({super.products = const []});
}

class ProductsLoadingError extends ProductsState {
  final String errorMessage;
  const ProductsLoadingError({
    required this.errorMessage,
    required super.products,
  });
}

class ProductsUpdated extends ProductsState {
  const ProductsUpdated({
    required super.products,
  });
}
