
import 'package:fitcker/enums/workout_type.dart';
import 'package:fitcker/providers/workout/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutList extends ConsumerWidget {
  final WorkoutType type;

  const WorkoutList({super.key, required this.type});

  @override
  Widget build(BuildContext context, ref) {
    final unfilteredWorkouts = ref.watch(workoutNotifierProvider);
    final workouts = unfilteredWorkouts
        .where((workout) => workout.type == type)
        .toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        final workout = workouts[index];
        if (workouts.isEmpty) {
          return Center(child: Text('No workouts data'));
        }
        return Card(
          child: ListTile(
            enabled: false,
            title: Text(
              workout.name,
              style: TextStyle(
                color: workout.isCompleted ? Colors.grey : Colors.white,
                decoration: workout.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              '${workout.sets} sets of ${workout.reps} reps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: workout.isCompleted,
                  onChanged: (_) {
                    ref
                        .read(workoutNotifierProvider.notifier)
                        .toggleWorkoutStatus(workout.id);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref
                        .read(workoutNotifierProvider.notifier)
                        .removeWorkout(workout.id);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
