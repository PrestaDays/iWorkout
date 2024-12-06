import 'package:iworkout/features/workout/domain/entities/workout.dart';

abstract class WorkoutsState {}

class WorkoutsLoading extends WorkoutsState {}

class WorkoutsLoaded extends WorkoutsState {
  final List<Workout> workouts;

  WorkoutsLoaded({required this.workouts});
}

class WorkoutsLoadingFailure extends WorkoutsState {
  final String errorMessage;

  WorkoutsLoadingFailure({required this.errorMessage});
}

