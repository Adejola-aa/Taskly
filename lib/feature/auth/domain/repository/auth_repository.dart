import 'package:taskly/feature/auth/domain/entity/app_user.dart';

abstract class AuthRepository {
  Future<AppUser> getCurrentUser();

  Future<AppUser> signInWithGoogle();

  Future<AppUser> signInWithApple();

  Future<AppUser> signInWithEmail(String email, String password);

  Future<AppUser> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  });

  Future<void> resetPassword(String email);

  Future<void> signOut();
}
