import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/models/validation_model.dart';
import 'package:food_delivery/src/values/app_validation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  void onEmailUpdate(String email) {
    emit(state.updatedEmail(email: email));
  }

  void onPasswordUpdate(String password) {
    emit(state.updatedPassword(password: password));
  }

  void onLoginPressed() {}
}
