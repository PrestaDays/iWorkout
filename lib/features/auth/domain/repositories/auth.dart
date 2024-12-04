import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signInWithGoogle();

  Future<Either> getUser();

  bool isLoggedIn();

  Future<Either> logout();
}