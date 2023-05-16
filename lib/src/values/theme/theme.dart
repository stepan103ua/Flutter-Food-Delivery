import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';
import 'package:food_delivery/src/values/theme/app_navigation_destination_theme.dart';

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

const bottomNavigationTheme = NavigationBarThemeData(
  backgroundColor: AppColors.greenBackground,
  elevation: 0,
  labelTextStyle: MaterialStatePropertyAll(
    TextStyle(
      color: AppColors.green,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
  iconTheme: MaterialStatePropertyAll(
    IconThemeData(
      color: AppColors.lightGrey,
      size: 28,
    ),
  ),
  indicatorColor: AppColors.white,
  labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
);

const appBarTheme = AppBarTheme(
  backgroundColor: AppColors.transparent,
  foregroundColor: AppColors.white,
  titleTextStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
  titleSpacing: 20,
  toolbarHeight: 80,
);

const iconTheme = IconThemeData(color: AppColors.white, size: 30);

final theme = ThemeData(
  useMaterial3: true,
  appBarTheme: appBarTheme,
  fontFamily: fontFamily,
  primaryColor: AppColors.green,
  scaffoldBackgroundColor: AppColors.greenBackground,
  iconTheme: iconTheme,
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  navigationBarTheme: bottomNavigationTheme,
  textTheme: textTheme,
);

extension TextThemeExtension on TextTheme {
  TextStyle get logoTitleLarge => const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: AppColors.green,
      );
  TextStyle get logoTitleMedium => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AppColors.green,
      );
  TextStyle get categoryItemSmall => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );
}

extension ThemeExtension on ThemeData {
  AppNavigationDestinationTheme get appNavigationDestinationTheme =>
      AppNavigationDestinationTheme(
        selectedIconColor: AppColors.green,
        selectedIconSize: 30,
      );
}
