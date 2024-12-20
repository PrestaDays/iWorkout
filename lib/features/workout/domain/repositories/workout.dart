import 'package:dartz/dartz.dart';
import 'package:iworkout/features/workout/data/models/create_workouts_req_params.dart';
import 'package:iworkout/features/workout/data/models/delete_workout_req_params.dart';
import 'package:iworkout/features/workout/data/models/get_workouts_req_params.dart';
import 'package:iworkout/features/workout/domain/entities/workout.dart';

abstract class WorkoutRepository {
  Future<Either<Error, List<WorkoutItem>>> getWorkouts(GetWorkoutsReqParams param);

  Future<Either<Error, void>> deleteWorkout(DeleteWorkoutReqParams param);

  Future<Either<Error, void>> createWorkout(String userId, CreateWorkoutsReqParams param);
}