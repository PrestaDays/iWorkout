import 'package:dartz/dartz.dart';
import 'package:iworkout/core/usecases/usecase.dart';
import 'package:iworkout/features/workout/data/models/delete_workout_req_params.dart';
import 'package:iworkout/features/workout/domain/repositories/workout.dart';
import 'package:iworkout/service_locater.dart';

class DeleteWorkoutUseCase implements UseCase<Either<Error, void>, DeleteWorkoutReqParams> {

  @override
  call({required DeleteWorkoutReqParams param}) async {
    return sl<WorkoutRepository>().deleteWorkout(param);
  }
}
