import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFFAF7FC);
  static const primary = Colors.deepPurple;
  static const accent = Colors.purpleAccent;
  static const green = Colors.green;
  static const greenLight = Color(0xFFC8E6C9);
  static const textDark = Colors.black87;
  static const textLight = Colors.grey;
  static const card = Colors.white;
}

class AppTheme {
  static ThemeData get light => ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: AppColors.textDark),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textDark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.textDark,
            backgroundColor: AppColors.greenLight,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      );
}
