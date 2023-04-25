import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/theme/theme.dart';

class InvertedElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const InvertedElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context)
            .copyWith(elevatedButtonTheme: invertedElevatedButton),
        child: ElevatedButton(onPressed: onPressed, child: child),
      );
}
