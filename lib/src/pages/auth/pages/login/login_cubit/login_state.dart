part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final ValidationModel email;
  final ValidationModel password;

  const LoginState({required this.email, required this.password});

  LoginState updated({ValidationModel? email, ValidationModel? password}) =>
      LoginUpdated(
        email: email ?? this.email,
        password: password ?? this.password,
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
  List<Object> get props => [email, password];
}

class LoginInitial extends LoginState {
  const LoginInitial({
    super.email = const ValidationModel(value: ''),
    super.password = const ValidationModel(value: ''),
  });
}

class LoginUpdated extends LoginState {
  const LoginUpdated({required super.email, required super.password});
}
