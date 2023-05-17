import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_order_request.g.dart';

@JsonSerializable()
class CreateOrderRequest extends Equatable {
  @JsonKey(name: 'receiver_city')
  final String city;
  @JsonKey(name: 'receiver_house_number')
  final String buildingNumber;
  @JsonKey(name: 'receiver_street')
  final String street;
  @JsonKey(name: 'receiver_phone_number')
  final String phoneNumber;

  const CreateOrderRequest({
    required this.city,
    required this.buildingNumber,
    required this.street,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);

  @override
  List<Object?> get props => [city, buildingNumber, street, phoneNumber];
}
