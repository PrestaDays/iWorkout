import 'package:dartz/dartz.dart';
import 'package:iworkout/core/usecases/usecase.dart';
import 'package:iworkout/features/auth/data/models/workout_day_req_params.dart';
import 'package:iworkout/features/workout/domain/repositories/workout_day.dart';
import 'package:iworkout/service_locater.dart';

class GetWorkoutDayUseCase implements UseCase<Either, WorkoutDayReqParams> {
  @override
  Future<Either> call({required WorkoutDayReqParams param}) async {
    return sl<WorkoutDayRepository>().getWorkoutById(param);
  }
}
