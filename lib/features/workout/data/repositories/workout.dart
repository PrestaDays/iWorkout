import 'package:dartz/dartz.dart';
import 'package:iworkout/features/workout/data/models/get_workouts_req_params.dart';
import 'package:iworkout/features/workout/data/source/workout_firebase_service.dart';
import 'package:iworkout/features/workout/domain/entities/workout.dart';
import 'package:iworkout/features/workout/domain/repositories/workout.dart';
import 'package:iworkout/service_locater.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  @override
  Future<Either<Error, List<Workout>>> getWorkouts(
      GetWorkoutsReqParams param) async {
    try {
      var workouts =
          await sl<WorkoutApiService>().getWorkoutByUserId(param.userId);

      return Right(workouts);
    } catch (e) {
      return Left(e as Error);
    }
  }
}
