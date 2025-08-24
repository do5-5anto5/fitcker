import 'package:fitcker/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.bio,
  });

  factory UserModel.fromJson(Map<String, String> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
    );
  }

  UserModel copyWith({String? id, String? name, String? email, String? bio}) {
    return UserModel(
      id: id ?? super.id,
      name: name ?? super.name,
      email: email ?? super.email,
      bio: bio ?? super.bio,
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      bio: user.bio,
    );
  }
}
