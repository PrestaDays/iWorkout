import 'package:iworkout/features/auth/domain/entities/user.dart';

abstract class WorkoutDayState {}

class WorkoutDayLoading extends WorkoutDayState {}

class WorkoutDayLoaded extends WorkoutDayState {
  // final UserEntity userEntity;
  // UserLoaded({required this.userEntity});
}

class WorkoutDayLoadingFailure extends WorkoutDayState {
  final String errorMessage;

  WorkoutDayLoadingFailure({required this.errorMessage});
}
