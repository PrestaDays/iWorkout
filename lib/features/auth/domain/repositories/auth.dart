import 'package:dartz/dartz.dart';
import 'package:iworkout/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either> signInWithGoogle();

  Future<Either<Error, UserEntity>> getUser();

  bool isLoggedIn();

  Future<Either> logout();
}