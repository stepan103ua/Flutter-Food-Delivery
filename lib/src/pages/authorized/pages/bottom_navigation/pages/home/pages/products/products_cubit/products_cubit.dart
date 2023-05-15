import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/errors/api_error.dart';

import '../models/product.dart';
import '../models/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _productsRepository;
  final String category;

  ProductsCubit({
    required this.category,
    required ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
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
}
