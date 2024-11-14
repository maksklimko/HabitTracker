import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../db_tables/habit_history_entries_table.dart';
import '../db_tables/habits_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Habits, HabitHistoryEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'database');
  }

  Future<List<HabitHistoryEntry>> getHabitHistory(Habit habit) {
    return (select(habitHistoryEntries)..where((c) => c.habit.equals(habit.id)))
        .get();
  }

  Future<List<Habit>> getHabits() {
    return select(habits).get();
  }

  Future<void> clearDatabase() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}