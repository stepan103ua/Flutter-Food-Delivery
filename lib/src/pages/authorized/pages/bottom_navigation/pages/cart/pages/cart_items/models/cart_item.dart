import 'package:equatable/equatable.dart';

class CartItem extends Equatable{
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

  @override
  List<Object?> get props => [productName, imageUrl, productPrice, quantity];
}
