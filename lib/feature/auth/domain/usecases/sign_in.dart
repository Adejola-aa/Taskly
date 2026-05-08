import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class SignInWithEmail {
  final AuthRepository _repository;

  const SignInWithEmail(this._repository);

  Future<AppUserEntity> call(String email, String password) {
    return _repository.signInWithEmail(email, password);
  }
}
