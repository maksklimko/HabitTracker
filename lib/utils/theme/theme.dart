import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();

  //TODO:add font
  //TODO:add text style
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness:  Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness:  Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
  );
}