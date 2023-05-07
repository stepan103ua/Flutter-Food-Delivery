import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel extends Equatable {
  @JsonKey(name: 'product_name')
  final String productName;

  @JsonKey(name: 'product_image')
  final String imageUrl;

  @JsonKey(name: 'product_price')
  final double productPrice;

  final int quantity;

  const CartItemModel({
    required this.productName,
    required this.imageUrl,
    required this.productPrice,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> data) =>
      _$CartItemModelFromJson(data);

  @override
  List<Object?> get props => [productName, imageUrl, productPrice, quantity];
}
