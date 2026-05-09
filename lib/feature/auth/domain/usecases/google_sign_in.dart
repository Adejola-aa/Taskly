import 'package:fpdart/fpdart.dart';
import 'package:taskly/core/error/failure.dart';
import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository _repository;

  const SignInWithGoogle(this._repository);

  Future<Either<Failure, AppUserEntity>> call() {
    return _repository.signInWithGoogle();
  }
}
