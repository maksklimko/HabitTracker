import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/providers/settings_tab_provider.dart';
import 'package:habit_tracker/providers/theme_provider.dart';
import 'package:habit_tracker/screens/settings_tab/widgets/theme_segmented_button.dart';
import 'package:habit_tracker/widgets/loading_widget.dart';

//todo: add error screen and error widget with rive animation
class SettingsTab extends ConsumerWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsTabState = ref.watch(settingsTabProvider);
    final themeProvider = ref.watch(appThemeStateNotifier);
    return settingsTabState.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 60,
              ),
              ThemeSegmentedButton(
                themeMode: data.appTheme,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Allow notifications",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  CupertinoSwitch(
                    value: data.isNotificationAllowed,
                    thumbColor:
                        themeProvider.getCurrentBrightness() == Brightness.light
                            ? Colors.white
                            : Colors.black,
                    activeColor:
                    themeProvider.getCurrentBrightness() == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    trackColor:
                    Colors.grey,
                    onChanged: (value) {
                      ref
                          .read(settingsTabProvider.notifier)
                          .updateIsNotificationsAllowed(value);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
      error: (e, _) => throw UnimplementedError(),
      loading: () => const LoadingWidget(),
    );
  }
}
