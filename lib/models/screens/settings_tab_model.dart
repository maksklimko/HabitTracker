import 'package:flutter/material.dart';

class SettingsTabModel {
  final ThemeMode appTheme;
  final bool isNotificationAllowed;

  SettingsTabModel(this.isNotificationAllowed, this.appTheme);
}