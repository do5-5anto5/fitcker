import 'package:fitcker/core/configs/router_configs/router.dart';
import 'package:fitcker/providers/onboarding/onboarding_provider.dart';
import 'package:fitcker/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // TODO: implement Auth Guard
    // final hasOnboardingSeen = ref.read(hasSeenOnboardingProvider);
    // final user = ref.watch(authNotifierProvider);

    final router = ref.watch(routeProvider);
    return MaterialApp.router(
      title: 'Fitcker',
      theme: theme,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
