import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/screens/main_screen/UI/main_screen.dart';

final mainScreenRouteProvider = StateProvider<MainScreenRoute>((ref) {
  return MainScreenRoute.home;
});