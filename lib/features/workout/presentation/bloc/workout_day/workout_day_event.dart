import 'package:iworkout/features/auth/data/models/workout_day_req_params.dart';

abstract class WorkoutDayEvent {}

class FetchWorkoutDayEvent extends WorkoutDayEvent {
  final WorkoutDayReqParams workoutDayReqParams;

  FetchWorkoutDayEvent({required this.workoutDayReqParams});
}

class AddWorkoutExec extends WorkoutDayEvent {
  final String exec;

  AddWorkoutExec({required this.exec});
}
