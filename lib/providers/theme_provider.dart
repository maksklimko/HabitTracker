import 'package:flutter/material.dart';
import 'package:habit_tracker/providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/shared_preferences_service.dart';

final appThemeStateNotifier = ChangeNotifierProvider((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);

  return prefs.maybeWhen(
    data: (data)=> AppThemeState(SharedPreferencesService(data).appTheme),
    orElse: () => AppThemeState(ThemeMode.system),
  );
});

class AppThemeState extends ChangeNotifier {
  AppThemeState(this.appTheme) {
    updateTheme(appTheme);
  }

  ThemeMode appTheme;

  void updateTheme(ThemeMode theme) {
    appTheme = theme;
    notifyListeners();
  }
}
