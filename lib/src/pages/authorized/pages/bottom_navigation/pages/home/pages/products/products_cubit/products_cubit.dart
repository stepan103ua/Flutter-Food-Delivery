import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/product_detail/product_detail_cubit/product_detail_callback.dart';

import '../models/product.dart';
import '../models/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductDetailCallback _productDetailCallback;
  final ProductsRepository _productsRepository;
  final String category;

  ProductsCubit({
    required this.category,
    required ProductDetailCallback productDetailCallback,
    required ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        _productDetailCallback = productDetailCallback,
        super(const ProductsInitial()) {
    _init();
  }

  void _init() async {
    try {
      final products = await _productsRepository.getProducts(category);
      emit(state.updatedProducts(products));
    } on ApiError catch (e) {
      log(e.toString());
      emit(state.loadingError(e.toString()));
    }
  }

  void onQueryChanged(String query) async {
    try {
      final products = await _productsRepository.getProductsByQuery(query);
      emit(state.updatedProducts(products));
    } catch (e) {
      emit(state.loadingError(e.toString()));
    }
  }

  void onProductDetailOpen(String productName) {
    _productDetailCallback.onProductDetailOpen(productName);
  }
}
