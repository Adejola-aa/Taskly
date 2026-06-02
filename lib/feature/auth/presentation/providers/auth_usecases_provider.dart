import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taskly/feature/auth/domain/usecases/sign_in.dart';
import 'package:taskly/feature/auth/domain/usecases/sign_out.dart';
import 'package:taskly/feature/auth/domain/usecases/sign_up.dart';
import 'package:taskly/feature/auth/domain/usecases/apple_sign_in.dart';
import 'package:taskly/feature/auth/domain/usecases/google_sign_in.dart';
import 'package:taskly/feature/auth/domain/usecases/reset_password.dart';
import 'package:taskly/feature/auth/presentation/providers/auth_providers.dart';

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository);
});

final googleSignInUseCaseProvider = Provider<SignInWithGoogleUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInWithGoogleUseCase(repository);
});

final appleSignInUseCaseProvider = Provider<SignInWithAppleUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInWithAppleUseCase(repository);
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repository);
});

final resetPasswordUseCaseProvider = Provider<ResetPasswordUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return ResetPasswordUseCase(repository);
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUseCase(repository);
});
