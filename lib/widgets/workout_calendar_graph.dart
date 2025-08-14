import 'package:fitcker/providers/workout/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutCalendarGraph extends HookConsumerWidget {
  const WorkoutCalendarGraph({super.key});
  String _getDateKey(DateTime date) {
    return '${date.year}-${date.month}-W${date.day}';
  }

  int _getGraphItemOpacity(int count) {
    return switch (count) {
      0 => 25,
      1 => 100,
      2 => 150,
      3 => 200,
      _ => 255,
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(workoutNotifierProvider);
    final startDate = useMemoized(() {
      final initialwWorkout = workouts.firstOrNull;
      if (initialwWorkout == null) {
        return DateTime.now();
      }
      return initialwWorkout.createdAt;
    });

    final counts = useMemoized(() {
      Map<String, int> countsMap = {};
      for (final workout in workouts) {
        if (!workout.isCompleted) {
          continue;
        }
        if (workout.isCompleted) {
          final completedDate = workout.completedAt;
          final dateKey = _getDateKey(completedDate!);
          countsMap[dateKey] = (countsMap[dateKey] ?? 0) + 1;
        }
      }
      return countsMap;
    }, [workouts]);

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Activity Graph',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                'Last 30 days',
                style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(178),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Row(
              children: List.generate(31, (index) {
                final date = startDate.add(Duration(days: index));
                final dateKey = _getDateKey(date);
                final count = counts[dateKey] ?? 0;
                final opacity = _getGraphItemOpacity(count);

                return Expanded(
                  child: Tooltip(
                    message:
                        '$count workout${2 != 1 ? 's' : ''} on ${index + 1}/${DateTime.now().month}',
                    child: Container(
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(opacity),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
