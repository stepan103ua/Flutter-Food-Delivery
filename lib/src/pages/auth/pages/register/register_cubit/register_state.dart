part of 'register_cubit.dart';

abstract class RegisterState extends Equatable with WithMessages {
  final RegisterStep step;
  final ValidationModel name;
  final ValidationModel lastName;
  final ValidationModel email;
  final ValidationModel password;
  final ValidationModel confirmPassword;
  final CitySuggestion? city;

  final List<CitySuggestion> citiesSuggestions;
  final List<CitySuggestion> foundCitiesSuggestions;
  final String query;

  @override
  final List<Message> messages;

  RegisterState({
    required this.name,
    required this.lastName,
    required this.email,
    required this.step,
    required this.citiesSuggestions,
    required this.city,
    required this.foundCitiesSuggestions,
    required this.query,
    required this.confirmPassword,
    required this.password,
    required this.messages,
  });

  @override
  RegisterState updatedMessages(List<Message> messages) => RegisterUpdated(
        step: step,
        name: name,
        lastName: lastName,
        email: email,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  bool get canGoToCity =>
      name.isValid != null &&
      name.isValid! &&
      lastName.isValid != null &&
      lastName.isValid! &&
      email.isValid != null &&
      email.isValid!;

  bool get canGoToPassword => canGoToCity && city != null;

  bool get canCreateAccount =>
      canGoToPassword &&
      password.isValid != null &&
      password.isValid! &&
      confirmPassword.isValid != null &&
      confirmPassword.isValid!;

  RegisterState get loading => RegisterLoading(
        step: step,
        name: name,
        lastName: lastName,
        email: email,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  RegisterState get updated => RegisterUpdated(
    step: step,
    name: name,
    lastName: lastName,
    email: email,
    citiesSuggestions: citiesSuggestions,
    city: city,
    foundCitiesSuggestions: foundCitiesSuggestions,
    query: query,
    password: password,
    confirmPassword: confirmPassword,
    messages: messages,
  );

  RegisterState updatedPassword(String? password) => RegisterUpdated(
        step: step,
        name: name,
        lastName: lastName,
        email: email,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: AppValidation.passwordValidation(password),
        confirmPassword: confirmPassword,
        messages: messages,
      );

  RegisterState updatedConfirmPassword(String? confirmPassword) =>
      RegisterUpdated(
        step: step,
        name: name,
        lastName: lastName,
        email: email,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: AppValidation.confirmPasswordValidation(
          basePassword: password.value,
          confirmPassword: confirmPassword,
        ),
        messages: messages,
      );

  RegisterState updatedQuery({
    required List<CitySuggestion> foundCitiesSuggestions,
    required String query,
  }) =>
      RegisterUpdated(
        step: step,
        email: email,
        lastName: lastName,
        name: name,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  RegisterState updatedCity(CitySuggestion city) => RegisterUpdated(
        step: step,
        email: email,
        lastName: lastName,
        name: name,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  RegisterState updatedStep(RegisterStep step) => RegisterUpdated(
        step: step,
        email: email,
        lastName: lastName,
        name: name,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  RegisterState updatedCitiesSuggestions(
    List<CitySuggestion> citiesSuggestions,
  ) =>
      RegisterUpdated(
        step: step,
        name: name,
        lastName: lastName,
        email: email,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: citiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  RegisterState updatedName(String? name) => RegisterUpdated(
        name: AppValidation.fieldValidation(name),
        email: email,
        lastName: lastName,
        step: step,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  RegisterState updatedLastName(String? lastName) => RegisterUpdated(
        lastName: AppValidation.fieldValidation(lastName),
        email: email,
        name: name,
        step: step,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  RegisterState updatedEmail(String? email) => RegisterUpdated(
        email: AppValidation.emailValidation(email),
        name: name,
        lastName: lastName,
        step: step,
        citiesSuggestions: citiesSuggestions,
        city: city,
        foundCitiesSuggestions: foundCitiesSuggestions,
        query: query,
        password: password,
        confirmPassword: confirmPassword,
        messages: messages,
      );

  @override
  List<Object?> get props => [
        step,
        name,
        lastName,
        email,
        citiesSuggestions,
        city,
        foundCitiesSuggestions,
        query,
        password,
        confirmPassword,
        messages
      ];
}

class RegisterInitial extends RegisterState {
  RegisterInitial({
    super.step = RegisterStep.info,
    super.name = const ValidationModel(value: ''),
    super.lastName = const ValidationModel(value: ''),
    super.email = const ValidationModel(value: ''),
    super.citiesSuggestions = const [],
    super.city,
    super.foundCitiesSuggestions = const [],
    super.query = '',
    super.password = const ValidationModel(value: ''),
    super.confirmPassword = const ValidationModel(value: ''),
    super.messages = const [],
  });
}

class RegisterUpdated extends RegisterState {
  RegisterUpdated({
    required super.step,
    required super.name,
    required super.lastName,
    required super.email,
    required super.citiesSuggestions,
    required super.city,
    required super.foundCitiesSuggestions,
    required super.query,
    required super.password,
    required super.confirmPassword,
    required super.messages,
  });
}

class RegisterLoading extends RegisterState {
  RegisterLoading({
    required super.step,
    required super.name,
    required super.lastName,
    required super.email,
    required super.citiesSuggestions,
    required super.city,
    required super.foundCitiesSuggestions,
    required super.query,
    required super.password,
    required super.confirmPassword,
    required super.messages,
  });
}
