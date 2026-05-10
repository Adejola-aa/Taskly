import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:taskly/config/router/routes.dart';
import 'package:taskly/config/router/router_notifier.dart';
import 'package:taskly/core/utils/custom_page_transition.dart';
import 'package:taskly/core/utils/keyboard_observer.dart';
import 'package:taskly/feature/auth/presentation/providers/app_bootstrap_provider.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final refresh = GoRouterRefreshNotifier(ref, appBootstrapProvider);
  final rootNavKey = GlobalKey<NavigatorState>();
  return GoRouter(
    navigatorKey: rootNavKey,
    initialLocation: AppRoutes.splash,
    observers: [KeyboardDismissObserver()],
    refreshListenable: refresh,
    routes: [
      StatefulShellRoute.indexedStack(
        branches: [
          // --- Dashboard Tab ---
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.dashboard,
                name: RouteNames.dashboard,
                pageBuilder: (context, state) => buildFadeTransition(
                  context: context,
                  state: state,
                  child: const Placeholder(),
                ),
              ),
            ],
          ),

          // --- Calendar Tab ---
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.calendar,
                name: RouteNames.calendar,
                pageBuilder: (context, state) => buildFadeTransition(
                  context: context,
                  state: state,
                  child: const Placeholder(),
                ),
              ),
            ],
          ),

          // --- Categories Tab ---
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.categories,
                name: RouteNames.categories,
                pageBuilder: (context, state) => buildFadeTransition(
                  context: context,
                  state: state,
                  child: const Placeholder(),
                ),
              ),
            ],
          ),

          // --- Profile Tab ---
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: RouteNames.profile,
                pageBuilder: (context, state) => buildFadeTransition(
                  context: context,
                  state: state,
                  child: const Placeholder(),
                ),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.splash,
        name: RouteNames.splash,
        pageBuilder: (context, state) => buildFadeTransition(
          context: context,
          state: state,
          child: const Placeholder(),
        ),
      ),

      GoRoute(
        path: AppRoutes.onboarding,
        name: RouteNames.onboarding,
        pageBuilder: (context, state) => buildSlideTransition(
          context: context,
          state: state,
          child: const Placeholder(),
        ),
      ),

      GoRoute(
        path: AppRoutes.logIn,
        name: RouteNames.login,
        pageBuilder: (context, state) => buildSlideTransition(
          context: context,
          state: state,
          child: const Placeholder(),
        ),
      ),

      GoRoute(
        path: AppRoutes.signUp,
        name: RouteNames.signup,
        pageBuilder: (context, state) => buildSlideTransition(
          context: context,
          state: state,
          child: const Placeholder(),
        ),
      ),

      GoRoute(
        path: AppRoutes.forgetPassword,
        name: RouteNames.forgetPassword,
        pageBuilder: (context, state) => buildSlideTransition(
          context: context,
          state: state,
          child: const Placeholder(),
        ),
      ),
    ],

    redirect: (context, state) {
      final bootstrap = ref.read(appBootstrapProvider);
      final loc = state.matchedLocation;

      if (bootstrap.isLoading) {
        return loc == AppRoutes.splash ? null : AppRoutes.splash;
      }

      final hasSeenOnboarding = bootstrap.value?.hasSeenOnboarding ?? false;
      final user = bootstrap.value?.user;

      if (loc == AppRoutes.splash) {
        return hasSeenOnboarding
            ? (user != null ? AppRoutes.dashboard : AppRoutes.logIn)
            : AppRoutes.onboarding;
      }

      if (!hasSeenOnboarding) {
        return loc == AppRoutes.onboarding ? null : AppRoutes.onboarding;
      }

      final isAuthRoute =
          loc == AppRoutes.logIn ||
          loc == AppRoutes.signUp ||
          loc == AppRoutes.forgetPassword;

      // final isProtected =
      //     loc.startsWith(AppRoutes.dashboard) ||
      //     loc.startsWith(AppRoutes.calendar) ||
      //     loc.startsWith(AppRoutes.categories) ||
      //     loc.startsWith(AppRoutes.profile);

      if (user == null) {
        return isAuthRoute ? null : AppRoutes.logIn;
      }

      if (isAuthRoute) {
        return AppRoutes.dashboard;
      }

      return null;
    },
  );
});
