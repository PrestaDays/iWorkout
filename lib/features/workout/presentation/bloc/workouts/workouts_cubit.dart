import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/features/auth/domain/usecases/get_user.dart';
import 'package:iworkout/features/workout/data/models/get_workouts_req_params.dart';
import 'package:iworkout/features/workout/domain/usecases/get_workout.dart';
import 'package:iworkout/features/workout/presentation/bloc/workouts/workouts_state.dart';
import 'package:iworkout/service_locater.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  WorkoutsCubit() : super(WorkoutsLoading());

  Future<void> execute() async {
    emit(WorkoutsLoading());

    var userResult = await sl<GetUserUseCase>().call();

    if (userResult.isLeft()) {
      emit(WorkoutsLoadingFailure(errorMessage: "Une erreur est survenue"));
      return;
    }

    final user = userResult.fold(
          (error) => throw Exception("Unexpected Left encountered"),
          (data) => data,
    );

    var result = await sl<GetWorkoutUseCase>().call(
        param: GetWorkoutsReqParams(userId: user.id)
    );

    result.fold(
            (error) =>
            emit(WorkoutsLoadingFailure(errorMessage: error.toString())),
            (data) => emit(WorkoutsLoaded(workouts: data)));
  }

}
