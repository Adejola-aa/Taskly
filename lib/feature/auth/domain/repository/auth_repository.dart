import 'package:fpdart/fpdart.dart';
import 'package:taskly/core/error/failure.dart';
import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUserEntity?>> getCurrentUser();

  Future<Either<Failure, AppUserEntity>> signInWithGoogle();

  Future<Either<Failure, AppUserEntity>> signInWithApple();

  Future<Either<Failure, AppUserEntity>> signInWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, AppUserEntity>> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  });

  Future<Either<Failure, void>> resetPassword(String email);

  Future<Either<Failure, void>> signOut();
}
