import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/features/workout/domain/usecases/get_workout_day.dart';
import 'package:iworkout/features/workout/presentation/bloc/workout_day/workout_day_event.dart';
import 'package:iworkout/features/workout/presentation/bloc/workout_day/workout_day_state.dart';
import 'package:iworkout/service_locater.dart';

class WorkoutDayBloc extends Bloc<WorkoutDayEvent, WorkoutDayState> {
  WorkoutDayBloc() : super(WorkoutDayLoading()) {
    on<FetchWorkoutDayEvent>(_onFetchWorkoutDayEvent);
    on<AddWorkoutExec>(_onAddWorkoutExec);
  }

  void _onFetchWorkoutDayEvent(
      FetchWorkoutDayEvent event, Emitter<WorkoutDayState> emit) async {
    emit(WorkoutDayLoading());
    var result =
        await sl<GetWorkoutDayUseCase>().call(param: event.workoutDayReqParams);

    result.fold((error) {
      emit(WorkoutDayLoadingFailure(errorMessage: error));
    }, (data) {
      emit(WorkoutDayLoaded());
    });
  }

  void _onAddWorkoutExec(
      AddWorkoutExec event, Emitter<WorkoutDayState> emit) async {
    emit(WorkoutDayLoading());
    //var result = await sl<GetWorkoutDayUseCase>().call(param: event.workoutDayReqParams);
    print("here");
    emit(WorkoutDayLoaded());
  }
}
