import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../models/user/user.freezed.dart';
part '../../../models/user/user.g.dart';

@freezed
sealed class User {
  const factory User({
    required String id,
    required String name,
    required String email,
    String? bio,
    @Default(false) bool isAuthenticated,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
