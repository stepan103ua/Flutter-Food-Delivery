import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final bool? isValid;
  final Function(String) onChanged;
  final bool? isPassword;
  final Icon? suffixIcon;

  const AppTextField({
    super.key,
    required this.hint,
    this.isValid,
    required this.onChanged,
    this.isPassword,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) => TextField(
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                isValid != null
                    ? _ValidationStatus(isValid: isValid!)
                    : Container(),
                suffixIcon ?? Container(),
              ],
            ),
          ),
        ),
        onChanged: onChanged,
        obscureText: isPassword ?? false,
        enableSuggestions: !(isPassword ?? false),
        style: Theme.of(context).textTheme.bodyLarge,
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
