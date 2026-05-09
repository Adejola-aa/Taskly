import 'package:fpdart/fpdart.dart';
import 'package:taskly/core/error/failure.dart';
import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository _repository;

  GetCurrentUser(this._repository);

  Future<Either<Failure, AppUserEntity?>> call() {
    return _repository.getCurrentUser();
  }
}
