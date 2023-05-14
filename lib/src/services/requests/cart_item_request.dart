import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_request.g.dart';

@JsonSerializable()
class CartItemRequest extends Equatable {
  @JsonKey(name: 'product_name')
  final String productNameSlug;

  final int quantity;

  const CartItemRequest({
    required this.productNameSlug,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$AddItemsToCartRequestToJson(this);

  @override
  List<Object?> get props => [productNameSlug, quantity];
}
