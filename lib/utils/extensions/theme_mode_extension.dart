import 'package:flutter/material.dart';

extension ThemeModeExtension on String {
  ThemeMode toThemeMode() {
    return ThemeMode.values.firstWhere((e) => e.name == this);
  }
}