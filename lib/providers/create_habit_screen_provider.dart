import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/models/database/database.dart';
import 'package:habit_tracker/models/screens/create_habit_model.dart';
import 'package:habit_tracker/providers/database_provider.dart';
import 'package:habit_tracker/providers/home_tab_provider.dart';

final createHabitProvider =
    StateNotifierProvider<CreateHabitNotifier, CreateHabitModel>(
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

class CreateHabitNotifier extends StateNotifier<CreateHabitModel> {
  CreateHabitNotifier(this.db, this.ref)
      : super(CreateHabitModel(
          title: '',
          description: '',
        ));
  final AppDatabase db;
  final Ref ref;

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateDescription(String description) {
    state = state.copyWith(description: description);
  }

  void reset() {
    state = CreateHabitModel(title: '', description: '');
  }

  Future save(BuildContext ctx) async {
    await db.addHabit(state);
    ref.invalidate(homeTabProvider);

    reset();

    Beamer.of(ctx).beamBack();
  }
}
