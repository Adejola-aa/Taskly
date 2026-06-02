import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/core/utils/app_preferences.dart';
import 'package:taskly/feature/auth/data/datasource/remote_datasource.dart';
import 'package:taskly/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

final firebaseInstanceProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final auth = ref.watch(firebaseInstanceProvider);
  return AuthRemoteDataSourceImpl(auth);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remote);
});

final onboardingProvider = FutureProvider<bool>((ref) async {
  return AppPreferences.hasSeenOnboarding();
});
