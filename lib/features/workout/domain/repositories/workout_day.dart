import 'package:dartz/dartz.dart';
import 'package:iworkout/features/auth/data/models/workout_day_req_params.dart';

abstract class WorkoutDayRepository {
  Future<Either> getWorkoutById(WorkoutDayReqParams param);
}