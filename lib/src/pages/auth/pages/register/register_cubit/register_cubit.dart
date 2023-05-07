import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/models/message.dart';
import 'package:food_delivery/src/models/with_messages.dart';
import 'package:food_delivery/src/pages/auth/auth_cubit/auth_callback.dart';
import 'package:food_delivery/src/pages/auth/pages/register/models/city_suggestion.dart';
import 'package:food_delivery/src/pages/auth/pages/register/models/register_repository.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_callback.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_message.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_step_enum.dart';
import 'package:food_delivery/src/repositories/auth_repository.dart';
import 'package:food_delivery/src/services/requests/register_request.dart';

import '../../../../../models/validation_model.dart';
import '../../../../../values/app_validation.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterCallback _callback;
  final AuthCallback _authCallback;
  final AuthRepository _authRepository;
  final RegisterRepository _repository;

  RegisterCubit({
    required RegisterCallback callback,
    required RegisterRepository repository,
    required AuthCallback authCallback,
    required AuthRepository authRepository,
  })  : _callback = callback,
        _repository = repository,
        _authCallback = authCallback,
        _authRepository = authRepository,
        super(RegisterInitial()) {
    _init();
  }

  void _init() async {
    final citiesSuggestions = await _repository.getCitiesSuggestions();
    emit(state.updatedCitiesSuggestions(citiesSuggestions));
  }

  void onCreateAccount() async {
    if (!state.canCreateAccount) {
      return;
    }

    try {
      final request = RegisterRequest(
        name: state.name.value,
        lastName: state.lastName.value,
        email: state.email.value,
        city: state.city!.name,
        password: state.password.value,
      );
      emit(state.loading);
      await _authRepository.register(request);
      _authCallback.onAuthenticated();
    } on ApiError catch (error) {
      emit(state.updated);
      emit(
        state.pushMessage(FailedToRegisterMessage(errorMessage: error.message)),
      );
    }
  }

  void popMessage(Message message) => emit(state.popMessage(message));

  void onPasswordChanged(String? password) =>
      emit(state.updatedPassword(password));

  void onConfirmPasswordChanged(String? confirmPassword) =>
      emit(state.updatedConfirmPassword(confirmPassword));

  void onNameChanged(String? name) => emit(state.updatedName(name));

  void onLastNameChanged(String? lastName) =>
      emit(state.updatedLastName(lastName));

  void onEmailChanged(String? email) => emit(state.updatedEmail(email));

  void onSelectCity(CitySuggestion city) => emit(state.updatedCity(city));

  void onQueryChanged(String query) {
    final foundCities = _repository.searchCitiesSuggestions(
      loadedSuggestion: state.citiesSuggestions,
      query: query,
    );

    emit(state.updatedQuery(foundCitiesSuggestions: foundCities, query: query));
  }

  void nextPage() {
    switch (state.step) {
      case RegisterStep.info:
        emit(state.updatedStep(RegisterStep.city));
        break;
      case RegisterStep.city:
        emit(state.updatedStep(RegisterStep.password));
        break;
      case RegisterStep.password:
        return;
    }
  }

  void previousPage() {
    switch (state.step) {
      case RegisterStep.info:
        return;
      case RegisterStep.city:
        emit(state.updatedStep(RegisterStep.info));
        break;
      case RegisterStep.password:
        emit(state.updatedStep(RegisterStep.city));
        break;
    }
  }

  void backToLogin() => _callback.onBackToLogin();
}
