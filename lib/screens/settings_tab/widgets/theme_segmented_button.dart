import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/utils/extensions/string_extension.dart';

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
    final primaryColor = theme != currentTheme
        ? Colors.grey
        : Colors.black;
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(_getThemeIcon(theme), color: primaryColor),
          Text(
            theme.name.capitalize(),
            style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                  color: primaryColor,
                ),
          ),
        ],
      ),
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
