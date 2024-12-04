import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/providers/settings_tab_provider.dart';
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
              CupertinoSlidingSegmentedControl(
                groupValue: data.appTheme,
                children: [ThemeMode.light,ThemeMode.dark,ThemeMode.system].asMap().map((i, theme) {
                  return MapEntry(theme, _buildButtonSegment(theme));
                }),
                onValueChanged: (value) {
                  if (value != null) {
                    ref.read(settingsTabProvider.notifier).updateTheme(value);
                  }
                },
              )
            ],
          ),
        );
      },
      error: (e, _) => throw UnimplementedError(),
      loading: () => const LoadingWidget(),
    );
  }

  Widget _buildButtonSegment(ThemeMode theme) {
    return Text(theme.name);
  }
}
