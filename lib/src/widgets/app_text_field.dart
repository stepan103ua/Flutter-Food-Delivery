import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final bool? isValid;
  final Function(String) onChanged;
  final bool? isPassword;

  const AppTextField({
    super.key,
    required this.hint,
    this.isValid,
    required this.onChanged,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon:
              isValid != null ? _ValidationStatus(isValid: isValid!) : null,
        ),
        onChanged: onChanged,
        obscureText: isPassword ?? false,
        enableSuggestions: !(isPassword ?? false),
      );
}

class _ValidationStatus extends StatelessWidget {
  final bool isValid;

  const _ValidationStatus({required this.isValid});

  @override
  Widget build(BuildContext context) => isValid
      ? const Icon(
          Icons.check,
          color: AppColors.green,
        )
      : const Icon(
          Icons.close,
          color: AppColors.error,
        );
}
