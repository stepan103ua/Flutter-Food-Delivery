import 'package:food_delivery/src/models/message.dart';

class FailedToLoginMessage extends Message {
  final String errorMessage;

  FailedToLoginMessage(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}