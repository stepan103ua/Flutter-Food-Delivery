import 'package:food_delivery/src/models/message.dart';

class FailedToRegisterMessage extends Message {
  final String errorMessage;

  FailedToRegisterMessage({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}