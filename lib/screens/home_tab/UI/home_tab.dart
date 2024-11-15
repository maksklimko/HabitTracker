import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/providers/home_tab_provider.dart';
import 'package:habit_tracker/screens/home_tab/widgets/habit_view.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTabState = ref.watch(homeTabProvider);
    return homeTabState.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (model) {
        return Column(
          children: [
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              alignment: Alignment.centerRight,
                  child: const Icon(Icons.add,size: 30,),
            ),
            const SizedBox(height: 30),
            ...model.habitsData.keys.map(
                  (habit) => HabitView(
                habit: habit,
                history: model.habitsData[habit]??[],
              ),
            ),
          ]
        );
      },
    );
  }
}
