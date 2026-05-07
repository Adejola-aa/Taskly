import 'package:taskly/feature/auth/domain/entity/app_user.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository _repository;

  GetCurrentUser(this._repository);

  Future<AppUser?> call() {
    return _repository.getCurrentUser();
  }
}
