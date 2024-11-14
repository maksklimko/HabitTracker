import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/providers/bottom_navigation_provider.dart';
import 'package:habit_tracker/screens/home_tab/UI/home_tab.dart';
import 'package:habit_tracker/screens/settings_tab.dart';
import 'package:habit_tracker/screens/statistic_tab/UI/statistic_tab.dart';

enum MainScreenRoute {
  home,
  statistic,
  settings,
}

class MainScreen extends ConsumerWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(mainScreenRouteProvider).index,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Statistic",
            icon: Icon(Icons.analytics_outlined),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings),
          ),
        ],
        onTap: (i) => ref.read(mainScreenRouteProvider.notifier).state =
            MainScreenRoute.values[i],
      ),
      body: getCurrentTab(ref.read(mainScreenRouteProvider.notifier).state),
    );
  }

  Widget getCurrentTab(MainScreenRoute route) {
    switch (route) {
      case MainScreenRoute.home:
        return const HomeTab();
      case MainScreenRoute.statistic:
        return const StatisticTab();
      case MainScreenRoute.settings:
        return const SettingsTab();
      default:
        return const HomeTab();
    }
  }
}
