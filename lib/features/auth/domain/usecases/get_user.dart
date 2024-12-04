import 'package:dartz/dartz.dart';
import 'package:iworkout/core/usecases/usecase.dart';
import 'package:iworkout/features/auth/domain/repositories/auth.dart';
import 'package:iworkout/service_locater.dart';


class GetUserUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({dynamic param}) async {
    return sl<AuthRepository>().getUser();
  }

}