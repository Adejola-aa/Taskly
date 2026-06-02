import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskly/core/error/app_exception.dart';

AppException mapFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return AuthException(message: 'No account found with this email');

    case 'wrong-password':
      return AuthException(message: 'Incorrect password');

    case 'user-disabled':
      return AuthException(message: 'This account has been disabled');

    case 'invalid-email':
      return AuthException(message: 'Invalid email format');

    case 'email-already-in-use':
      return AuthException(message: 'Email already exists');

    case 'operation-not-allowed':
      return AuthException(message: 'This sign-in method is disabled');

    case 'weak-password':
      return AuthException(message: 'Password is too weak');

    case 'network-request-failed':
      return NetworkException(message: 'No internet connection');

    case 'too-many-requests':
      return AuthException(message: 'Too many attempts. Try again later');

    case 'invalid-credential':
      return AuthException(message: 'Invalid login credentials');

    default:
      return AuthException(
        message: e.message ?? 'Authentication failed',
        code: e.code,
      );
  }
}
