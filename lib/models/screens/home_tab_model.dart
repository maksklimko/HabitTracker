import 'package:habit_tracker/models/database/database.dart';

class HomeTabModel {
  Map<Habit, List<HabitHistoryEntry>> habitsData;

  HomeTabModel({required this.habitsData});
}
