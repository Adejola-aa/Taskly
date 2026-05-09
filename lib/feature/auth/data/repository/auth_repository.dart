import 'package:fpdart/fpdart.dart';
import 'package:taskly/core/error/app_exception.dart';
import 'package:taskly/core/error/failure.dart';
import 'package:taskly/feature/auth/data/datasource/remote_datasource.dart';
import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remote;

  const AuthRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, AppUserEntity?>> getCurrentUser() async {
    final user = await _remote.getCurrentUser();
    return Right(user);
  }

  @override
  Future<Either<Failure, AppUserEntity>> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final user = await _remote.signUpWithEmail(
        email: email,
        password: password,
        displayName: displayName,
      );
      return Right(user);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<Either<Failure, AppUserEntity>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final user = await _remote.signInWithEmail(email, password);
      return Right(user);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<Either<Failure, AppUserEntity>> signInWithGoogle() async {
    try {
      final user = await _remote.signInWithGoogle();
      return Right(user);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<Either<Failure, AppUserEntity>> signInWithApple() async {
    try {
      final user = await _remote.signInWithApple();
      return Right(user);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await _remote.resetPassword(email);
      return const Right(null);
    } catch (e) {
      return _handleException(e);
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _remote.signOut();
      return const Right(null);
    } catch (e) {
      return _handleException(e);
    }
  }

  Either<Failure, T> _handleException<T>(Object e) {
    if (e is AuthCanceledException) return const Left(CancelledFailure());
    if (e is AuthException) return Left(AuthFailure(message: e.message));
    if (e is NetworkException) return Left(NetworkFailure(message: e.message));
    if (e is ServerException) return Left(ServerFailure(message: e.message));
    return const Left(ServerFailure(message: 'Unexpected error occurred'));
  }
}
