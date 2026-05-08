import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';

abstract class AuthRepository {
  Future<AppUserEntity> getCurrentUser();

  Future<AppUserEntity> signInWithGoogle();

  Future<AppUserEntity> signInWithApple();

  Future<AppUserEntity> signInWithEmail(String email, String password);

  Future<AppUserEntity> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  });

  Future<void> resetPassword(String email);

  Future<void> signOut();
}
