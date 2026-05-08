import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class SignInWithApple {
  final AuthRepository _repository;

  const SignInWithApple(this._repository);

  Future<AppUserEntity> call() {
    return _repository.signInWithApple();
  }
}
