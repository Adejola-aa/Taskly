import 'package:fpdart/fpdart.dart';
import 'package:taskly/core/error/failure.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class SignOut {
  final AuthRepository _repository;

  const SignOut(this._repository);

  Future<Either<Failure, void>> call() {
    return _repository.signOut();
  }
}
