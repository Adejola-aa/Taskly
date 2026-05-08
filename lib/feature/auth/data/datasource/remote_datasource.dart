import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:taskly/feature/auth/data/model/app_user_model.dart';

abstract class AuthRemoteDatasource {
    Future<AppUserModel?> getCurrentUser();
  Future<AppUserModel> signInWithEmail(String email, String password);
  Future<AppUserModel> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  });
  Future<AppUserModel> signInWithGoogle();
  Future<AppUserModel> signInWithApple();
  Future<void> resetPassword(String email);
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSourceImpl({required this.auth, required this.googleSignIn});

@override
  Future<AppUserModel?> getCurrentUser() {
  
  }

@override
  Future<AppUserModel> signInWithEmail(String email, String password) {
    // TODO: implement signInWithEmail
    throw UnimplementedError();
  }

  @override
  Future<AppUserModel> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<AppUserModel> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<AppUserModel> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) {
    // TODO: implement signUpWithEmai
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
