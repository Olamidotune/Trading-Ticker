import 'package:cointicker/constants/app_colors.dart';
import 'package:flutter/material.dart';

//LIGHT MODE
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightBg,
  primaryColor: AppColors.primaryColor,
  colorScheme: const ColorScheme.light(
    primary: AppColors.whiteColor,
    secondary: AppColors.accentNeon,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.textColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textColor),
    bodyMedium: TextStyle(color: AppColors.textColor),
    bodySmall: TextStyle(
      color: AppColors.greyColor,
    ),
    displaySmall: TextStyle(color: AppColors.textColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.primaryColor.withValues(alpha: .04),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);

//DARK MODE
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkBg,
  primaryColor: AppColors.accentNeon,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.accentNeon,
    secondary: AppColors.accentNeon,
    surface: AppColors.darkSurface,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkSurface,
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: AppColors.whiteColor),
    bodySmall: TextStyle(
      color: AppColors.whiteColor,
    ),
    displaySmall: TextStyle(color: AppColors.accentNeon, fontSize: 18),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.primaryColor.withValues(alpha: .04),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.accentNeon,
      foregroundColor: AppColors.darkBg,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);
