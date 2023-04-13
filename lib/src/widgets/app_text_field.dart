import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final String? value;
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
    this.value,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final controller = TextEditingController();
  @override
  void initState() {
    controller.text = widget.value ?? '';
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.isValid != null
                    ? _ValidationStatus(isValid: widget.isValid!)
                    : Container(),
                widget.suffixIcon ?? Container(),
              ],
            ),
          ),
        ),
        onChanged: widget.onChanged,
        obscureText: widget.isPassword ?? false,
        enableSuggestions: !(widget.isPassword ?? false),
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
