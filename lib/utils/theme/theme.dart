import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/constants/colors.dart';

class AppTheme{
  AppTheme._();

  //TODO:add font
  //TODO:add text style
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness:  Brightness.light,
    primaryColor: AppColors.x08080a,
    scaffoldBackgroundColor: AppColors.xf6f6f7,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness:  Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
  );
}