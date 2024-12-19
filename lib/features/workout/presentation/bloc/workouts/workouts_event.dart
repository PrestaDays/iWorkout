class WorkoutsEvent {}

class FetchWorkouts extends WorkoutsEvent {}

class DeleteWorkout extends WorkoutsEvent {
  final String workoutId;

  DeleteWorkout({required this.workoutId});
}
