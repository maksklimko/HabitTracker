import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/models/screens/settings_tab_model.dart';
import 'package:habit_tracker/providers/shared_preferences_provider.dart';
import 'package:habit_tracker/providers/theme_provider.dart';
import 'package:habit_tracker/services/shared_preferences_service.dart';

final settingsTabProvider =
    StateNotifierProvider<SettingsTabNotifier, AsyncValue<SettingsTabModel>>(
        (ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  final appThemeState = ref.watch(appThemeStateNotifier);
  return prefs.maybeWhen(
    data: (data) => SettingsTabNotifier(SharedPreferencesService(data),appThemeState),
    orElse: () => SettingsTabNotifier(null,appThemeState),
  );
});

class SettingsTabNotifier extends StateNotifier<AsyncValue<SettingsTabModel>> {
  final SharedPreferencesService? prefs;
  final AppThemeState themeState;

  SettingsTabNotifier(this.prefs, this.themeState)
      : super(const AsyncValue.loading()) {
    if (prefs != null) {
      loadData();
    }
  }

  Future loadData() async {
    final appTheme = prefs!.appTheme;
    final isNotificationsAllowed = prefs!.isNotificationsAllowed;

    final model = SettingsTabModel(isNotificationsAllowed, appTheme);
    state = AsyncValue.data(model);
  }

  void updateTheme(ThemeMode theme) {
    prefs!.setAppTheme(theme);
    themeState.updateTheme(theme);
  }

  void updateIsNotificationsAllowed(bool value) {
    prefs!.setIsNotificationsAllowed(value);
    state = AsyncValue.data(state.value!.copyWith(isNotificationAllowed: value));
  }
}
