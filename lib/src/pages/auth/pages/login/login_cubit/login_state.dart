part of 'login_cubit.dart';

abstract class LoginState extends Equatable with WithMessages {
  final ValidationModel email;
  final ValidationModel password;

  @override
  final List<Message> messages;

  LoginState({
    required this.email,
    required this.password,
    required this.messages,
  });

  @override
  LoginState updatedMessages(List<Message> messages) => LoginUpdated(
        email: email,
        password: password,
        messages: messages,
      );

  LoginState updated({ValidationModel? email, ValidationModel? password}) =>
      LoginUpdated(
        email: email ?? this.email,
        password: password ?? this.password,
        messages: messages,
      );

  LoginState updatedEmail({String? email}) => updated(
        email: AppValidation.emailValidation(email),
      );

  LoginState updatedPassword({String? password}) => updated(
        password: AppValidation.passwordValidation(password),
      );

  bool get isValid =>
      email.isValid != null &&
      email.isValid! &&
      password.isValid != null &&
      password.isValid!;

  @override
  List<Object> get props => [email, password, messages];
}

class LoginInitial extends LoginState {
  LoginInitial({
    super.email = const ValidationModel(value: ''),
    super.password = const ValidationModel(value: ''),
    super.messages = const [],
  });
}

class LoginUpdated extends LoginState {
  LoginUpdated({
    required super.email,
    required super.password,
    required super.messages,
  });
}
