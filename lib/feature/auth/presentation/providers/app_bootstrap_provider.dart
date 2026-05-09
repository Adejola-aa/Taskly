import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/core/utils/app_preferences.dart';
import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';
import 'package:taskly/feature/auth/presentation/providers/auth_providers.dart';

final appBootstrapProvider =
    StreamProvider<({bool hasSeenOnboarding, AppUserEntity? user})>((
      ref,
    ) async* {
      final authStream = ref.watch(firebaseInstanceProvider);
      final hasSeenOnboarding = await AppPreferences.hasSeenOnboarding();

      yield* authStream.authStateChanges().map(
        (user) => (
          hasSeenOnboarding: hasSeenOnboarding,
          user: user == null
              ? null
              : AppUserEntity(
                  id: user.uid,
                  email: user.email ?? '',
                  displayName: user.displayName ?? '',
                  photoUrl: user.photoURL,
                ),
        ),
      );
    });
