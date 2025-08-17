import 'dart:async';

import 'package:fitcker/core/configs/router_configs/route_names.dart';
import 'package:fitcker/providers/auth/auth_provider.dart';
import 'package:fitcker/providers/onboarding/onboarding_provider.dart';
import 'package:fitcker/screens/main_screen.dart';
import 'package:fitcker/screens/onboarding_screen.dart';
import 'package:fitcker/screens/profile_screen.dart';
import 'package:fitcker/screens/sign_in_screen.dart';
import 'package:fitcker/screens/sign_up_screen.dart';
import 'package:fitcker/screens/workout_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
part 'redirection.dart';

final routeProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/workout-list',
    errorBuilder: (context, state) {
      return const Scaffold(body: Center(child: Text('Page not found')));
    },
    redirect: (context, state) {
      final redirect = handleRedirect(context, state, ref);
      return redirect;
    },
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: RouteNames.onboarding,
        path: '/onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: '/sign-up',
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: RouteNames.signIn,
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
                name: RouteNames.workoutList,
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
