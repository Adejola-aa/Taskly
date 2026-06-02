import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/feature/auth/presentation/providers/auth_usecases_provider.dart';

class AuthController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    state = const AsyncLoading();

    final signUp = ref.read(signUpUseCaseProvider);

    final result = await signUp(
      email: email,
      password: password,
      displayName: name,
    );

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (user) => AsyncData(null),
    );
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();

    final signIn = ref.read(signInUseCaseProvider);

    final result = await signIn(email, password);

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (user) => AsyncData(null),
    );
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();

    final signInWithGoogle = ref.read(googleSignInUseCaseProvider);

    final result = await signInWithGoogle();

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (user) => AsyncData(null),
    );
  }

  Future<void> signInWithApple() async {
    state = const AsyncLoading();

    final signInWithApple = ref.read(appleSignInUseCaseProvider);

    final result = await signInWithApple();

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (user) => AsyncData(null),
    );
  }

  Future<void> resetPassword(String email) async {
    state = const AsyncLoading();

    final resetPassword = ref.read(resetPasswordUseCaseProvider);

    final result = await resetPassword(email);

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> signOut() async {
    state = const AsyncLoading();

    final signOut = ref.read(signOutUseCaseProvider);

    final result = await signOut();

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(
  AuthController.new,
);
