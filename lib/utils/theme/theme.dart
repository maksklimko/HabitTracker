import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/utils/constants/colors.dart';
import 'package:habit_tracker/utils/theme/input_decoration_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.x08080a,
    scaffoldBackgroundColor: AppColors.xf6f6f7,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.xf6f6f7,
      selectedItemColor: AppColors.x08080a,
      unselectedItemColor: AppColors.xbec0c7,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.x08080a,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.x08080a,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 16,
        color: AppColors.x08080a,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.x08080a,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.x08080a,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.x08080a,
      ),
    ),
    inputDecorationTheme: AppInputDecorationTheme.lightTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontSize: 38,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: 16,
        color: Colors.white,
      ),
      labelLarge: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: AppInputDecorationTheme.darkTheme,
  );
}
