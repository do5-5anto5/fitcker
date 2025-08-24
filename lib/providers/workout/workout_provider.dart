import 'package:fitcker/enums/workout_type.dart';
import 'package:fitcker/data/models/workout/workout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'workout_provider.g.dart';

@Riverpod(keepAlive: true)
class WorkoutNotifier extends _$WorkoutNotifier {
  final uuid = const Uuid();

  @override
  List<Workout> build() {
    return [];
  }

  void addWorkout(
    String name,
    double weight,
    int reps,
    int sets,
    WorkoutType type,
  ) {
    state = [
      ...state,
      Workout(
        id: uuid.v4(),
        name: name,
        weight: weight,
        reps: reps,
        sets: sets,
        isCompleted: false,
        type: type,
        createdAt: DateTime.now(),
        completedAt: null,
      ),
    ];
  }

  void toggleWorkoutStatus(String id) {
    state = [
      for (final workout in state)
        if (workout.id == id)
          workout.copyWith(
            isCompleted: !workout.isCompleted,
            completedAt: workout.isCompleted ? null : DateTime.now(),
          )
        else
          workout,
    ];
  }

  void removeWorkout(String id) {
    state = state.where((workout) => workout.id != id).toList();
  }
}
