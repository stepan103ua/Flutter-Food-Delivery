import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';

const String fontFamily = 'Inter';

final outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    width: 0,
    color: Colors.transparent,
  ),
);

final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.white,
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  border: outlineInputBorder,
  suffixIconColor: AppColors.green,
  errorStyle: const TextStyle(
    color: AppColors.error,
  ),
  hintStyle: TextStyle(
    fontSize: 20,
    color: AppColors.green.withOpacity(0.5),
  ),
  activeIndicatorBorder: const BorderSide(
    color: AppColors.green,
    width: 1.0,
  ),
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 10,
  ),
);

const elevatedButtonTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.green,
    foregroundColor: AppColors.white,
    textStyle: elevatedButtonTextStyle,
    padding: const EdgeInsets.symmetric(
      vertical: 12,
    ),
    disabledBackgroundColor: AppColors.green.withOpacity(0.3),
    disabledForegroundColor: AppColors.lightGrey,
  ),
);

final invertedElevatedButton = ElevatedButtonThemeData(
  style: elevatedButtonTheme.style?.copyWith(
    backgroundColor: const MaterialStatePropertyAll(AppColors.white),
    foregroundColor: const MaterialStatePropertyAll(AppColors.green),
    overlayColor: MaterialStatePropertyAll(
      AppColors.green.withOpacity(0.1),
    ),
    textStyle: MaterialStatePropertyAll(
      elevatedButtonTextStyle.copyWith(color: AppColors.green),
    ),
  ),
);

const textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  ),
  titleMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  ),
  titleSmall: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  ),
  bodyLarge: TextStyle(
    fontSize: 20,
    color: AppColors.green,
    fontWeight: FontWeight.w700,
  ),
);

final theme = ThemeData(
  useMaterial3: true,
  fontFamily: fontFamily,
  primaryColor: AppColors.green,
  scaffoldBackgroundColor: AppColors.greenBackground,
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textTheme: textTheme,
);

extension TextThemeExtension on TextTheme {
  TextStyle get logoTitle => const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: AppColors.green,
      );
}
