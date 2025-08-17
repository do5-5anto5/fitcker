part of 'router.dart';

FutureOr<String?> handleRedirect(
  BuildContext context,
  GoRouterState state,
  Ref ref,
) {
  final isSignIn = state.matchedLocation == '/sign-in';
  final isSignUp = state.matchedLocation == '/sign-up';
  final isOnboarding = state.matchedLocation == '/onboarding';
  if (isSignIn || isSignUp || isOnboarding) {
    return null;
  }

  // check if user has seen the onboarding screen
  final hasSeenOnboarding = _hasSeenOnboarding(ref);
  if (!hasSeenOnboarding) {
    return '/onboarding';
  }

  // check if user is logged in or not
  final isAuthenticated = _isAuthenticated(ref);
  if (!isAuthenticated) {
    // user can access any route
    return '/sign-in';
  }
  return null;
}

bool _hasSeenOnboarding(Ref<Object?> ref) {
  final hasSeenOnboarding = ref.read(hasSeenOnboardingProvider);
  return hasSeenOnboarding;
}

bool _isAuthenticated(Ref<Object?> ref) {
  final user = ref.read(authNotifierProvider);
  return user?.isAuthenticated == true;
}
