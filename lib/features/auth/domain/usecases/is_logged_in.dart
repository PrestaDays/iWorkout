import 'package:iworkout/core/usecases/usecase.dart';
import 'package:iworkout/features/auth/domain/repositories/auth.dart';
import 'package:iworkout/service_locater.dart';


class IsLoggedInUseCase implements UseCase<bool, dynamic> {

  @override
  Future<bool> call({dynamic param}) async {
    return sl<AuthRepository>().isLoggedIn();
  }

}