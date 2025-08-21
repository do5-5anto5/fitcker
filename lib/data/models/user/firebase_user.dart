import 'package:fitcker/domain/entities/user.dart';

class FirebaseUser extends User {
  const FirebaseUser({
    required super.id,
    required super.name,
    required super.email,
    required super.bio,
  });

  factory FirebaseUser.fromDoc(Map<String, dynamic> doc) {
    return FirebaseUser(
      id: doc['id'] as String,
      name: doc['name'] as String,
      email: doc['email'] as String,
      bio: doc['bio'] as String,
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      'id': super.id,
      'name': super.name,
      'email': super.email,
      'bio': super.bio,
    };
  }

  factory FirebaseUser.fromEntity(User user) {
    return FirebaseUser(
      id: user.id,
      name: user.name,
      email: user.email,
      bio: user.bio,
    );
  }
}
