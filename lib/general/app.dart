import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/providers/theme_provider.dart';
import 'package:habit_tracker/screens/main_screen/UI/main_screen.dart';
import 'package:habit_tracker/screens/splash_screen/UI/splash_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../screens/create_habit_screen/create_habit_screen.dart';
import '../utils/theme/theme.dart';

class App extends HookConsumerWidget {
  App({super.key});

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const SplashScreen(),
        '/main': (context, state, data) => const MainScreen(),
        '/createHabit': (context, state, data) => const CreateHabitScreen(),
        '/editHabit': (context, state, data) =>
            const CreateHabitScreen.editing(),
      },
    ).call,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);
    return MaterialApp.router(
      title: 'Habit tracker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appThemeState.appTheme,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
