import 'package:equatable/equatable.dart';

class ValidationModel extends Equatable {
  final String value;
  final bool? isValid;

  const ValidationModel({required this.value, this.isValid});

  @override
  List<Object?> get props => [value, isValid];
}
