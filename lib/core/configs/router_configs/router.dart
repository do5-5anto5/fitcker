import 'package:fitcker/core/configs/router_configs/route_names.dart';
import 'package:fitcker/screens/main_screen.dart';
import 'package:fitcker/screens/onboarding_screen.dart';
import 'package:fitcker/screens/profile_screen.dart';
import 'package:fitcker/screens/sign_in_screen.dart';
import 'package:fitcker/screens/sign_up_screen.dart';
import 'package:fitcker/screens/workout_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
    initialLocation: RouteNames.sign_in,
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
      // StatefulShellRoute.indexStack keeps track selected index
      // and preserves the state of each screen.
      // This is useful to MainScreen, that has a bottom navigation bar,
      // allowing to manage navigation without constantly rebuilding UI from scratch
      StatefulShellRoute.indexedStack(
        builder: (contesxt, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.workout_list,
                path: '/workout-list',
                builder: (context, state) => const WorkoutListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: RouteNames.profile,
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
