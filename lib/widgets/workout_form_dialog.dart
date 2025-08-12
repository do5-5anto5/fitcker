import 'package:fitcker/enums/workout_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutFormDialog extends HookConsumerWidget {
  const WorkoutFormDialog({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    late final TextEditingController nameController;
    late final TextEditingController weightController;
    late final TextEditingController repsController;
    late final TextEditingController setsController;
    WorkoutType selectedType = WorkoutType.upperBody;

    useEffect(() {
      print('Hello Dart');
      return null;
    }, []); // The empty array inside here grants the method runs just the first time of this widget building

    return AlertDialog(
      title: const Text('Add Workout'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter a name' : null,
            ),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter weight' : null,
            ),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(labelText: 'Reps'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter reps' : null,
            ),
            TextFormField(
              controller: TextEditingController(),
              decoration: const InputDecoration(labelText: 'Sets'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Please enter sets' : null,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<WorkoutType>(
              initialValue: selectedType,
              onChanged: (value) {
                if (value != null) {
                  // setState(() {
                  //   selectedType = value;
                  // });
                }
              },
              items: const [
                DropdownMenuItem(
                  value: WorkoutType.upperBody,
                  child: Text('Upper Body'),
                ),
                DropdownMenuItem(
                  value: WorkoutType.lowerBody,
                  child: Text('Lower Body'),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(onPressed: () {}, child: const Text('Add')),
      ],
    );
  }
}
