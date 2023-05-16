import 'dart:math';

import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final String productName;
  final String imageUrl;
  final double productPrice;
  final int quantity;

  double get totalPrice => productPrice * quantity;

  const CartItem({
    required this.productName,
    required this.imageUrl,
    required this.productPrice,
    required this.quantity,
  });

  CartItem copyWith({
    String? productName,
    String? imageUrl,
    double? productPrice,
    int? quantity,
  }) =>
      CartItem(
        productName: productName ?? this.productName,
        imageUrl: imageUrl ?? this.imageUrl,
        productPrice: productPrice ?? this.productPrice,
        quantity: quantity ?? this.quantity,
      );

  CartItem copyWithIncreasedQuantity() => copyWith(quantity: quantity + 1);

  CartItem copyWithDecreasedQuantity() =>
      copyWith(quantity: max(quantity - 1, 0));

  @override
  List<Object?> get props => [productName, imageUrl, productPrice, quantity];
}
