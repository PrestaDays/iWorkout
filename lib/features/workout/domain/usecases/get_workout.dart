import 'package:dartz/dartz.dart';
import 'package:iworkout/core/usecases/usecase.dart';
import 'package:iworkout/features/workout/data/models/get_workouts_req_params.dart';
import 'package:iworkout/features/workout/domain/entities/workout.dart';
import 'package:iworkout/features/workout/domain/repositories/workout.dart';
import 'package:iworkout/service_locater.dart';

class GetWorkoutUseCase implements UseCase<Either<Error, List<WorkoutItem>>, GetWorkoutsReqParams> {

  @override
  call({required GetWorkoutsReqParams param}) async {
    return sl<WorkoutRepository>().getWorkouts(param);
  }
}
