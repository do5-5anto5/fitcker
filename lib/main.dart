import 'package:fitcker/providers/onboarding/onboarding_provider.dart';
import 'package:fitcker/screens/workout_list_screen.dart';
import 'package:fitcker/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding =
      sharedPrefs.get('hasOnboardingInitialized') as bool?;
  runApp(
    ProviderScope(
      overrides: [
        hasSeenOnboardingProvider.overrideWith(
          (ref) => hasSeenOnboarding ?? false,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final hasOnboardingSeen = ref.read(hasSeenOnboardingProvider);
    return MaterialApp(
      title: 'Fitcker',
      theme: theme,
      home: hasOnboardingSeen? WorkoutListScreen() : OnboardingScreen(),
    );
  }
}
