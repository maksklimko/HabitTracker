import 'package:drift/drift.dart';
import 'package:habit_tracker/models/db_tables/habits_table.dart';

class HabitHistoryEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get habit => integer().references(Habits, #id)();

  DateTimeColumn get completedAt => dateTime()();
}
