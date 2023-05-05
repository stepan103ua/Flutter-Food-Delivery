import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/models/message.dart';
import 'package:food_delivery/src/models/validation_model.dart';
import 'package:food_delivery/src/pages/auth/pages/login/login_cubit/login_callback.dart';
import 'package:food_delivery/src/pages/auth/pages/login/login_cubit/login_message.dart';
import 'package:food_delivery/src/repositories/auth_repository.dart';
import 'package:food_delivery/src/services/requests/login_request.dart';
import 'package:food_delivery/src/values/app_validation.dart';

import '../../../../../models/with_messages.dart';
import '../../../auth_cubit/auth_callback.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _repository;
  final LoginCallback _callback;
  final AuthCallback _authCallback;

  LoginCubit({
    required LoginCallback callback,
    required AuthCallback authCallback,
    required AuthRepository repository,
  })  : _callback = callback,
        _authCallback = authCallback,
        _repository = repository,
        super(LoginInitial());

  void onEmailUpdate(String email) {
    emit(state.updatedEmail(email: email));
  }

  void onPasswordUpdate(String password) {
    emit(state.updatedPassword(password: password));
  }

  void onLoginPressed() async {
    if (!state.isValid) {
      return;
    }
    try {
      final request = LoginRequest(
        email: state.email.value,
        password: state.password.value,
      );

      await _repository.login(request);

      _authCallback.onAuthenticated();
    } on ApiError catch (error) {
      emit(state.pushMessage(FailedToLoginMessage(error.message)));
      print('PUSHED MESSAGE: ${error.message}');
      // log(runtimeType.toString(), error: error);
    }
  }

  void onCreateAccountPressed() => _callback.openCreateAccountPage();
}
