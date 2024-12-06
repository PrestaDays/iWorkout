import 'package:dartz/dartz.dart';
import 'package:iworkout/features/auth/data/models/user.dart';
import 'package:iworkout/features/auth/data/source/auth_firebase_service.dart';
import 'package:iworkout/features/auth/domain/entities/user.dart';
import 'package:iworkout/features/auth/domain/repositories/auth.dart';
import 'package:iworkout/service_locater.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signInWithGoogle() async {
    Either result = await sl<AuthApiService>().signInWithGoogle();
    return result.fold((error) {
      return Left(error);
    }, (data) async {
      return Right(data);
    });
  }

  @override
  Future<Either> logout() {
    return sl<AuthApiService>().logout();
  }

  @override
  Future<Either<Error, UserEntity>> getUser() async {
    Either result = await sl<AuthApiService>().getUser();
    return result.fold((error) {
      return Left(error);
    }, (data) {
      User response = data;
      final userModel = UserModel.fromMap({
        "id": response.uid,
        "displayName": response.displayName,
        "image": response.photoURL,
      });
      final userEntity = userModel.toEntity();
      return Right(userEntity);
    });
  }

  @override
  bool isLoggedIn() {
    return sl<AuthApiService>().isLoggedIn();
  }
}