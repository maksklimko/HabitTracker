import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/models/db_tables/habits_table.dart';
import 'package:habit_tracker/models/screens/home_tab_model.dart';
import 'package:habit_tracker/providers/database_provider.dart';

import '../models/database/database.dart';

final homeTabProvider =
    StateNotifierProvider<HomeTabNotifier, AsyncValue<HomeTabModel>>((ref) {
  final db = ref.watch(databaseProvider);
  return HomeTabNotifier(db);
});

class HomeTabNotifier extends StateNotifier<AsyncValue<HomeTabModel>> {
  final AppDatabase db;

  HomeTabNotifier(this.db) : super(const AsyncValue.loading()) {
    loadData();
  }

  Future loadData({bool addLoader = true}) async {
    state = const AsyncValue.loading();
    // await db.clearDatabase();
    // await db.into(db.habits).insert(HabitsCompanion.insert(
    //   title: 'Drink water',
    //   motivation: const Value("I really need to drink water to be alive"),
    //   createdAt: DateUtils.dateOnly(DateTime.now()),
    // ));
    print(await db.getHabits());
    print(await db.getHabitHistory((await db.getHabits()).first));
    final habits = await db.getHabits();
    HomeTabModel model = HomeTabModel(habitsData: {});
    habits.map((habit) async {
      model.habitsData.addAll({habit: await db.getHabitHistory(habit)});
    }).toList();
    state = AsyncValue.data(model);
  }

  Future toggleDay(int habitId, bool isSelected, DateTime date) async {
    if (isSelected) {
      //remove all history records
      await db.deleteTodayHistoryRecords(habitId, date);
    } else {
      //add history record
      await db.addHistoryRecord(habitId, date);
    }
    loadData(addLoader: false);
  }
}
