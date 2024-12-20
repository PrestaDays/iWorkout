import 'package:dartz/dartz.dart';
import 'package:iworkout/features/workout/data/models/create_workouts_req_params.dart';
import 'package:iworkout/features/workout/data/models/delete_workout_req_params.dart';
import 'package:iworkout/features/workout/data/models/get_workouts_req_params.dart';
import 'package:iworkout/features/workout/data/source/workout_firebase_service.dart';
import 'package:iworkout/features/workout/domain/entities/workout.dart';
import 'package:iworkout/features/workout/domain/repositories/workout.dart';
import 'package:iworkout/service_locater.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  @override
  Future<Either<Error, List<WorkoutItem>>> getWorkouts(
      GetWorkoutsReqParams param) async {
    try {
      var workouts =
          await sl<WorkoutApiService>().getWorkoutByUserId(param.userId);

      return Right(workouts);
    } catch (e) {
      return Left(e as Error);
    }
  }

  @override
  Future<Either<Error, String>> deleteWorkout(
      DeleteWorkoutReqParams param) async {
    try {
      sl<WorkoutApiService>().deleteWorkout(param.workoutId);
      return Right(param.workoutId);
    } catch (e) {
      return Left(e as Error);
    }
  }

  @override
  Future<Either<Error, void>> createWorkout(String userId, CreateWorkoutsReqParams param) async {
    try {
      sl<WorkoutApiService>().createWorkout(userId, param);
      return Right(null);
    } catch (e) {
      return Left(e as Error);
    }
  }
}
