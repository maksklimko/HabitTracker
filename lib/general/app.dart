import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/main_screen/UI/main_screen.dart';
import 'package:habit_tracker/screens/splash_screen/UI/splash_screen.dart';
import 'package:habit_tracker/utils/theme/theme.dart';

import '../screens/create_habit_screen/create_habit_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const SplashScreen(),
        '/main': (context, state, data) => const MainScreen(),
        '/createHabit': (context, state, data) => const CreateHabitScreen(),
      },
    ).call,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Habit tracker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
