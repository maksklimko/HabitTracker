import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/constants/shared_preferences_keys.dart';
import 'package:habit_tracker/utils/extensions/theme_mode_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  ThemeMode get appTheme {
    final appThemePref = _prefs.getString(SharedPreferencesKeys.APP_THEME_KEY);
    return (appThemePref ?? ThemeMode.system.name).toThemeMode();
  }

  Future<void> setAppTheme(ThemeMode theme) async {
    await _prefs.setString(SharedPreferencesKeys.APP_THEME_KEY, theme.name);
  }

  bool get isNotificationsAllowed {
    final isNotificationsAllowedPref =
        _prefs.getBool(SharedPreferencesKeys.IS_NOTIFICATIONS_ALLOWED_KEY);
    return isNotificationsAllowedPref ?? true;
  }

  Future<void> setIsNotificationsAllowed(bool isNotificationsAllowed) async {
    await _prefs.setBool(
      SharedPreferencesKeys.IS_NOTIFICATIONS_ALLOWED_KEY,
      isNotificationsAllowed,
    );
  }
}
