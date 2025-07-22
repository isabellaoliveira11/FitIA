import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFFFFFFF); // branco
  static const primary = Color(0xFF34C759); // verde forte
  static const accent = Color(0xFF34C759);
  static const textDark = Color(0xFF1C1C1E); // cinza bem escuro
  static const textLight = Color(0xFF8E8E93); // cinza claro
  static const card = Color(0xFFF2F2F7); // cinza clarinho
}

class AppTheme {
  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        cardColor: AppColors.card,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textDark,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: AppColors.textDark,
            fontFamily: 'Roboto',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColors.primary,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
        useMaterial3: true,
      );


}
