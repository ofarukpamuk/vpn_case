import 'package:flutter/material.dart';
import 'package:vpn_case/core/init/theme/app_colors.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    cardTheme: CardTheme(
      color: AppColors.cardBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryBlue,
      background: AppColors.backgroundColor,
      surface: AppColors.cardBackground,
      onPrimary: AppColors.textLight,
      onSurface: AppColors.textPrimary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardTheme: CardTheme(
      color: AppColors.cardBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textLight),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryBlue,
      background: AppColors.darkBackground,
      surface: AppColors.cardBackground,
      onPrimary: AppColors.textLight,
      onSurface: AppColors.textLight,
    ),
  );
}
