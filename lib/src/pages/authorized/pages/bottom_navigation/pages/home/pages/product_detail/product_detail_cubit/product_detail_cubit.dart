import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/pages/products/models/product.dart';

import '../models/product_detail_repository.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({
    required this.productName,
    required ProductDetailRepository productDetailRepository,
  })  : _productDetailRepository = productDetailRepository,
        super(
          ProductDetailInitial(
            product: Product(
              image:
                  'https://cdn.discordapp.com/attachments/1046399512526205038/1106624150971371640/image.png',
              name: '',
              price: 0,
              description: '',
            ),
          ),
        ) {
    getProductDetail(productName);
  }
  final ProductDetailRepository _productDetailRepository;
  final String productName;

  void getProductDetail(String name) async {
    emit(ProductDetailLoading(product: state.product));
    try {
      final response = await _productDetailRepository.getProductDetail(name);

      emit(ProductDetailLoaded(product: response));
    } catch (error) {
      emit(
        ProductDetailError(
          errorMessage: error.toString(),
          product: state.product,
        ),
      );
    }
  }
}
