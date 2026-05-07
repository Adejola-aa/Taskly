import 'package:taskly/feature/auth/domain/entity/app_user.dart';
import 'package:taskly/feature/auth/domain/repository/auth_repository.dart';

class SignInWithGoogle {
  final AuthRepository _repository;

  const SignInWithGoogle(this._repository);

  Future<AppUser> call() {
    return _repository.signInWithGoogle();
  }
}
