import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/settings_tab_provider.dart';

class ThemeSegmentedButton extends ConsumerWidget {
  const ThemeSegmentedButton({
    super.key,
    required this.themeMode,
  });

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
        groupValue: themeMode,
        children: [ThemeMode.light, ThemeMode.dark, ThemeMode.system]
            .asMap()
            .map((i, theme) {
          return MapEntry(
              theme, _buildButtonSegment(context, theme, themeMode));
        }),
        onValueChanged: (value) {
          if (value != null) {
            ref.read(settingsTabProvider.notifier).updateTheme(value);
          }
        },
      ),
    );
  }

  Widget _buildButtonSegment(
      BuildContext ctx, ThemeMode theme, ThemeMode currentTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(_getThemeIcon(theme),
            color: theme != currentTheme
                ? currentTheme==ThemeMode.dark
                    ? Colors.white
                    : Colors.black
                : null),
        Text(
          theme.name,
          style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme == currentTheme ? Colors.black : null),
        ),
      ],
    );
  }

  IconData _getThemeIcon(ThemeMode theme) {
    switch (theme) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.settings;
    }
  }
}
