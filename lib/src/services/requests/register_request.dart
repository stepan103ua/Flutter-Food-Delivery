import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  final String name;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  @JsonKey(name: 'settlement')
  final String city;
  final String password;

  const RegisterRequest({
    required this.name,
    required this.lastName,
    required this.email,
    required this.city,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  List<Object?> get props => [name, lastName, email, city, password];
}
