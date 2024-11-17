import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:habit_tracker/models/database/database.dart';
import 'package:habit_tracker/screens/home_tab/widgets/day_tile.dart';

class HabitView extends StatelessWidget {
  const HabitView({super.key, required this.habit, required this.history});

  final Habit habit;
  final List<HabitHistoryEntry> history;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            habit.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 32,
                ),
                ...List.generate(100, (i) => i).map((e) {
                  final date =
                      DateUtils.dateOnly(DateTime.now().subtract(e.days));
                  final isSelected = history.any((e) =>
                      e.habit == habit.id &&
                      history.any((record) => record.completedAt == date));
                  return DayTile(
                    habitId: habit.id,
                    isSelected: isSelected,
                    date: date,
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
