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

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.green,
    foregroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    splashFactory: NoSplash.splashFactory,
    padding: const EdgeInsets.symmetric(
      vertical: 13,
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
);

final theme = ThemeData(
  fontFamily: fontFamily,
  primaryColor: AppColors.green,
  scaffoldBackgroundColor: AppColors.greenBackground,
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textTheme: textTheme,
);
