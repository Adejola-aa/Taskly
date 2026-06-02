import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';

final authStateProvider = StreamProvider<AppUserEntity?>((ref) {
  return FirebaseAuth.instance.authStateChanges().map((user) {
    if (user == null) return null;

    return AppUserEntity(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      photoUrl: user.photoURL,
    );
  });
});
