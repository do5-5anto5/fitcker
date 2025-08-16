import 'package:fitcker/providers/quote/quote_provider.dart';
import 'package:fitcker/providers/workout/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/workout_type.dart';
import '../widgets/workout_calendar_graph.dart';
import '../widgets/workout_form_dialog.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const SizedBox.shrink(),
          toolbarHeight: 240,
          flexibleSpace: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 56.0, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    Consumer(
                      builder: (_, WidgetRef ref, _) {
                        final quote = ref.watch(getQuoteProvider);
                        return quote.maybeWhen(
                          data: (data) {
                            return Column(
                              children: [
                                Text(
                                  data.quote,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // The refresh() method returns a AsyncValue<T> .
                                    // So essentially, refresh is an invalidate() method followed by a read to grab the updated state.
                                    // final _ = ref.refresh(getQuoteProvider);
                                    ref.invalidate(getQuoteProvider);
                                  },
                                  child: Text('Refresh'),
                                ),
                              ],
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),
                    WorkoutCalendarGraph(),
                  ],
                ),
              ),
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: TabBar(
              tabs: [
                Tab(text: 'Upper Body'),
                Tab(text: 'Lower Body'),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            _WorkoutList(type: WorkoutType.upperBody),
            _WorkoutList(type: WorkoutType.lowerBody),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddWorkoutDialog(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddWorkoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const WorkoutFormDialog(),
    );
  }
}

class _WorkoutList extends ConsumerWidget {
  final WorkoutType type;

  const _WorkoutList({required this.type});

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
