import 'package:dartz/dartz.dart';
import 'package:iworkout/core/usecases/usecase.dart';
import 'package:iworkout/features/auth/domain/usecases/get_user.dart';
import 'package:iworkout/features/workout/data/models/create_workouts_req_params.dart';
import 'package:iworkout/features/workout/domain/repositories/workout.dart';
import 'package:iworkout/service_locater.dart';

class CreateWorkoutUseCase implements UseCase<Either<Error, void>, CreateWorkoutsReqParams> {

  @override
  call({required CreateWorkoutsReqParams param}) async {
    final user = await sl<GetUserUseCase>().call();

    return user.fold(
      (error) => Left(Error()),
      (user) => sl<WorkoutRepository>().createWorkout(user.id, param)
    );
  }
}
