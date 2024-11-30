import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/widgets/app_text_field.dart';
import 'package:habit_tracker/widgets/cross_button.dart';
import '../../providers/create_habit_screen_provider.dart';
import '../../widgets/app_button.dart';

class CreateHabitScreen extends ConsumerWidget {
  const CreateHabitScreen({super.key, this.isCreating = true});

  const CreateHabitScreen.editing({
    super.key,
    this.isCreating = false,
  });

  final bool isCreating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = ref.watch(titleControllerProvider);
    final descriptionController = ref.watch(descriptionControllerProvider);
    final createHabit = ref.watch(createHabitProvider);

    titleController.text = createHabit.title;
    descriptionController.text = createHabit.motivation ?? '';
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isCreating ? 'New habit' : 'Edit habit',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const CrossButton(),
            ],
          ),
          const Spacer(),
          Text('Name', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 10),
          AppTextField(
            hint: 'Drink water',
            controller: titleController,
            onChanged: ref.read(createHabitProvider.notifier).updateTitle,
          ),
          const SizedBox(height: 30),
          Text('Description', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 10),
          AppTextField(
            isMultiline: true,
            hint: 'Describe your motivation...',
            controller: descriptionController,
            onChanged: ref.read(createHabitProvider.notifier).updateMotivation,
          ),
          const Spacer(flex: 10),
          AppButton(
            title: isCreating ? 'Create' : 'Save',
            onTap: () {
              ref.read(createHabitProvider.notifier).save(context);
            },
          ),
        ],
      ),
    ));
  }
}
