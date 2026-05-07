import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class ResetPassword {
  final AuthRepository _repository;

  const ResetPassword(this._repository);

  Future<void> call(String email) {
    return _repository.resetPassword(email);
  }
}
