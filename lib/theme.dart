import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';

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
  hintStyle: const TextStyle(
    color: Color(0xff594C74),
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

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.green,
    foregroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    splashFactory: NoSplash.splashFactory,
    padding: const EdgeInsets.symmetric(
      vertical: 12,
    ),
  ),
);

const textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.green,
  ),
  bodyLarge: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
  ),
  bodyMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
);

final theme = ThemeData(
  fontFamily: 'Inter',
  primaryColor: AppColors.green,
  scaffoldBackgroundColor: AppColors.greenBackground,
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textTheme: textTheme,
);
