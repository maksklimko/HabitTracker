import 'package:flutter/material.dart';

class SettingsTabModel {
  final ThemeMode appTheme;
  final bool isNotificationAllowed;

  SettingsTabModel(this.isNotificationAllowed, this.appTheme);

  SettingsTabModel copyWith({
    ThemeMode? appTheme,
    bool? isNotificationAllowed,
  }) {
    return SettingsTabModel(
      isNotificationAllowed ?? this.isNotificationAllowed,
      appTheme ?? this.appTheme,
    );
  }
}