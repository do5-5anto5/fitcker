
import 'package:fitcker/models/workout/workout.dart';
import 'package:flutter/material.dart';

import 'stat_item.dart';

class StatsRow extends StatelessWidget {
  final List<Workout> workouts;

  const StatsRow({super.key, required this.workouts});

  @override
  Widget build(BuildContext context) {
    final completedWorkouts = workouts.where((w) => w.isCompleted).length;
    final inProgressWorkouts = workouts.where((w) => !w.isCompleted).length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatItem(
            value: '${workouts.length}',
            label: 'Workouts',
            icon: Icons.fitness_center,
          ),
          StatItem(
            value: '$completedWorkouts',
            label: 'Completed',
            icon: Icons.check_circle,
          ),
          StatItem(
            value: '$inProgressWorkouts',
            label: 'In Progress',
            icon: Icons.pending,
          ),
        ],
      ),
    );
  }
}
