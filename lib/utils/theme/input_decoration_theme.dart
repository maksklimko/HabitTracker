import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();

  static InputDecorationTheme lightTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.xbec0c7, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.xbec0c7, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.xbec0c7, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    hintStyle: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.xbec0c7,
    ),
  );

  static InputDecorationTheme darkTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    hintStyle: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.grey,
    ),
  );
}
