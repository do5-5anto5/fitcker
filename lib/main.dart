import 'package:fitcker/utils/theme.dart';
import 'package:flutter/material.dart';

import 'screens/onboarding_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitcker',
      theme: theme,
      home: const OnboardingScreen(),
    );
  }
}
