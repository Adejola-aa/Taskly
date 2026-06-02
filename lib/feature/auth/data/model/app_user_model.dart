import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskly/feature/auth/domain/entity/app_user_entity.dart';

class AppUserModel extends AppUserEntity {
  const AppUserModel({
    required super.id,
    required super.email,
    required super.displayName,
    super.photoUrl,
  });

  factory AppUserModel.fromFirestore(Map<String, dynamic> data, String id) {
    return AppUserModel(
      id: id,
      email: data['email'] ?? '',
      displayName: data['displayName'] ?? '',
      photoUrl: data['photoUrl'],
    );
  }

  factory AppUserModel.fromFirebaseUser(User user) {
    return AppUserModel(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      photoUrl: user.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'displayName': displayName, 'photoUrl': photoUrl};
  }
}
