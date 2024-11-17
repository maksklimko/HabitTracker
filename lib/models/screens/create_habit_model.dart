class CreateHabitModel {
  final String title;
  final String description;

  CreateHabitModel({
    required this.title,
    required this.description,
  });

  CreateHabitModel copyWith({
    String? title,
    String? description,
  }) {
    return CreateHabitModel(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}