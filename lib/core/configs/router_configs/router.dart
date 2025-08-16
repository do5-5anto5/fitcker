import 'package:fitcker/core/configs/router_configs/route_names.dart';
import 'package:fitcker/screens/main_screen.dart';
import 'package:fitcker/screens/onboarding_screen.dart';
import 'package:fitcker/screens/sign_in_screen.dart';
import 'package:fitcker/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
    initialLocation: RouteNames.sign_up,
    errorBuilder: (context, state) {
      return const Scaffold(body: Center(child: Text('Page not found')));
    },
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RouteNames.onboarding,
        path: '/onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        name: RouteNames.sign_up,
        path: '/sign-up',
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: RouteNames.sign_in,
        path: '/sign-in',
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        name: RouteNames.main_screen,
        path: '/main-screen',
        builder: (context, state) => MainScreen(),
      ),
    ],
  );
});
