import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_item_to_cart_request.g.dart';

@JsonSerializable()
class AddItemsToCartRequest extends Equatable {
  @JsonKey(name: 'product_name')
  final String productNameSlug;

  final int quantity;

  const AddItemsToCartRequest({
    required this.productNameSlug,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => _$AddItemsToCartRequestToJson(this);

  @override
  List<Object?> get props => [productNameSlug, quantity];
}
