import 'package:dartz/dartz.dart';
import 'package:fitcker/domain/entities/user.dart';

abstract class AuthRepo {
  // Unit is just a replacement of void, but it avoids potential issues.
  Future<Either<String, Unit>> signInWithEmailAndPassword(String email, String password);
  Future<Either<String, Unit>> signUp(User user);
  Future<Either<String, Unit>> signOut();
  Future<Either<String, Unit>> getSignedUser();
}
