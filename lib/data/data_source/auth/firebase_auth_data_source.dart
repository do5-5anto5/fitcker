import 'package:fitcker/data/data_source/auth/auth_data_source.dart';
import 'package:fitcker/domain/entities/user.dart';

class FirebaseAuthDataSource implements AuthDataSource{
  @override
  Future<User> getSignedUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(User user) {
    throw UnimplementedError();
  }
}