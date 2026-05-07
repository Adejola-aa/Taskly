import 'package:taskly/feature/auth/domain/entity/app_user.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class SignUpWithEmail {
  final AuthRepository _repository;

  const SignUpWithEmail(this._repository);

  Future<AppUser> call({
    required String email,
    required String password,
    required String displayName,
  }) {
    return _repository.signUpWithEmail(
      email: email,
      password: password,
      displayName: displayName,
    );
  }
}
