import 'package:food_delivery/src/models/validation_model.dart';
import 'package:food_delivery/src/values/app_regexes.dart';

abstract class AppValidation {
  static ValidationModel emailValidation(String? email) {
    if (email == null || email.isEmpty) {
      return ValidationModel(value: email ?? '', isValid: false);
    }
    final emailValid = RegExp(AppRegexes.emailRegex).hasMatch(email);
    return ValidationModel(value: email, isValid: emailValid);
  }

  static ValidationModel passwordValidation(String? password) {
    if (password == null || password.length < 6) {
      return ValidationModel(value: password ?? '', isValid: false);
    }
    return ValidationModel(value: password, isValid: true);
  }

  static ValidationModel confirmPasswordValidation({
    required String? basePassword,
    required String? confirmPassword,
  }) {
    final confirmPasswordValidation = passwordValidation(confirmPassword);

    if (confirmPasswordValidation.isValid != null &&
        !confirmPasswordValidation.isValid!) {
      return confirmPasswordValidation;
    }

    return ValidationModel(
      value: confirmPassword!,
      isValid: basePassword == confirmPassword,
    );
  }

  static ValidationModel fieldValidation(String? field) {
    if (field == null || field.isEmpty) {
      return ValidationModel(value: field ?? '', isValid: false);
    }
    return ValidationModel(value: field, isValid: true);
  }
}
