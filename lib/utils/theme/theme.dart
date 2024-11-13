import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/utils/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.x08080a,
    scaffoldBackgroundColor: AppColors.xf6f6f7,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        fontSize: 38,
        fontWeight: FontWeight.bold,
        color: AppColors.xf6f6f7,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.roboto(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ));
}
