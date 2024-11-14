import 'package:drift/drift.dart';

class Habits extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(max: 50)();

  TextColumn get motivation => text().nullable().withLength(max: 150)();

  DateTimeColumn get createdAt => dateTime()();
}
