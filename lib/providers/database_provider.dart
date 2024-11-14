import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/models/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  return db;
});