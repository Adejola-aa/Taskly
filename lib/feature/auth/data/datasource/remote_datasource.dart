import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:taskly/core/error/app_exception.dart';
import 'package:taskly/core/utils/app_logger.dart';
import 'package:taskly/feature/auth/data/datasource/auth_error_mapper.dart';
import 'package:taskly/feature/auth/data/model/app_user_model.dart';

abstract class AuthRemoteDatasource {
  Future<AppUserModel> signIn(String email, String password);
  Future<AppUserModel> signUp({
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

  const AuthRemoteDataSourceImpl(this.auth);

  @override
  Future<AppUserModel> signIn(String email, String password) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user!;
      return AppUserModel.fromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      throw mapFirebaseAuthException(e);
    } catch (e, s) {
      appLogger.e('Unexpected sign in error', error: e, stackTrace: s);
      throw const ServerException(
        message: 'Something went wrong. Please try again.',
      );
    }
  }

  @override
  Future<AppUserModel> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;

      if (!googleSignIn.supportsAuthenticate()) {
        throw const ServerException(
          message: 'Google sign-in is not supported on this platform.',
        );
      }

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final result = await auth.signInWithCredential(credential);

      final user = result.user!;

      return AppUserModel.fromFirebaseUser(user);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw const AuthCanceledException();
      }
      throw const ServerException(
        message: 'Google sign-in failed. Please try again.',
      );
    } on FirebaseAuthException catch (e) {
      throw mapFirebaseAuthException(e);
    } catch (e, s) {
      appLogger.e('Unexpected Google sign-in error', error: e, stackTrace: s);
      throw const ServerException(
        message: 'Google sign-in failed. Please try again.',
      );
    }
  }

  @override
  Future<AppUserModel> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final result = await auth.signInWithCredential(oauthCredential);

      final user = result.user!;

      return AppUserModel.fromFirebaseUser(user);
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        throw const AuthCanceledException();
      }
      throw const ServerException(
        message: 'Apple sign-in failed. Please try again.',
      );
    } on FirebaseAuthException catch (e) {
      throw mapFirebaseAuthException(e);
    } catch (e, s) {
      appLogger.e('Unexpected Apple sign-in error', error: e, stackTrace: s);
      throw const ServerException(
        message: 'Apple sign-in failed. Please try again.',
      );
    }
  }

  @override
  Future<AppUserModel> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user!;

      try {
        await user.updateDisplayName(displayName);
        await user.reload();
      } catch (e, s) {
        appLogger.w('Display name update failed', error: e, stackTrace: s);
      }

      final updatedUser = auth.currentUser!;

      return AppUserModel.fromFirebaseUser(updatedUser);
    } on FirebaseAuthException catch (e) {
      throw mapFirebaseAuthException(e);
    } catch (e, s) {
      appLogger.e('Unexpected sign up error', error: e, stackTrace: s);
      throw const ServerException(
        message: 'Something went wrong. Please try again.',
      );
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw mapFirebaseAuthException(e);
    } catch (e, s) {
      appLogger.e('Unexpected reset password error', error: e, stackTrace: s);
      throw const ServerException(
        message: 'Something went wrong. Please try again.',
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      final isGoogleUser =
          auth.currentUser?.providerData.any(
            (provider) => provider.providerId == 'google.com',
          ) ??
          false;

      if (isGoogleUser) {
        try {
          await GoogleSignIn.instance.signOut();
        } catch (e, s) {
          appLogger.w('Google sign-out failed', error: e, stackTrace: s);
        }
      }

      await auth.signOut();
    } catch (e, s) {
      appLogger.e('Unexpected sign out error', error: e, stackTrace: s);
      throw const ServerException(message: 'Failed to sign out.');
    }
  }
}
