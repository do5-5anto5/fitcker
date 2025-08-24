import 'package:dartz/dartz.dart';
import 'package:fitcker/data/data_source/auth/auth_data_source.dart';
import 'package:fitcker/domain/entities/user.dart';
import 'package:fitcker/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource authDataSource;
  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Either<String, User>> getSignedUser() async {
    try {
      final user = await authDataSource.getSignedUser();
      return Right(user);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await authDataSource.signInWithEmailAndPassword(email, password);
      return Right(unit);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signOut()  async {
    try {
      await authDataSource.signOut();
      return Right(unit);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signUp(User user) async {
    try {
      
      await authDataSource.signUp(user);
      return Right(unit);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
