import 'package:beamer/beamer.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/models/database/database.dart';
import 'package:habit_tracker/providers/database_provider.dart';
import 'package:habit_tracker/providers/home_tab_provider.dart';

final createHabitProvider = StateNotifierProvider<CreateHabitNotifier, Habit>(
  (ref) {
    final db = ref.read(databaseProvider);
    return CreateHabitNotifier(db, ref);
  },
);

final titleControllerProvider = Provider<TextEditingController>(
  (ref) {
    final controller = TextEditingController();
    ref.onDispose(controller.dispose);
    return controller;
  },
);

final descriptionControllerProvider = Provider<TextEditingController>(
  (ref) {
    final controller = TextEditingController();
    ref.onDispose(controller.dispose);
    return controller;
  },
);

class CreateHabitNotifier extends StateNotifier<Habit> {
  CreateHabitNotifier(this.db, this.ref) : super(_emptyHabit());

  final AppDatabase db;
  final Ref ref;

  static Habit _emptyHabit() =>
      Habit(id: -1, title: '', createdAt: DateTime.now());

  void setHabit(Habit habit) => state = habit;

  void updateTitle(String title) => state = state.copyWith(title: title);

  void updateMotivation(String? motivation) =>
      state = state.copyWith(motivation: Value(motivation));

  void reset() => state = _emptyHabit();

  Future<void> save(BuildContext ctx) async {
    if (state.id == -1) {
      await db.addHabit(state);
    } else {
      await db.editHabit(state);
    }
    ref.invalidate(homeTabProvider);
    reset();
    Beamer.of(ctx).beamBack();
  }
}
