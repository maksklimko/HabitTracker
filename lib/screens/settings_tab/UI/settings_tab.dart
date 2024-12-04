import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/providers/settings_tab_provider.dart';
import 'package:habit_tracker/screens/settings_tab/widgets/theme_segmented_button.dart';
import 'package:habit_tracker/widgets/loading_widget.dart';

//todo: add error screen and error widget with rive animation
class SettingsTab extends ConsumerWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsTabState = ref.watch(settingsTabProvider);
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
              ThemeSegmentedButton(themeMode: data.appTheme,),
            ],
          ),
        );
      },
      error: (e, _) => throw UnimplementedError(),
      loading: () => const LoadingWidget(),
    );
  }
}
