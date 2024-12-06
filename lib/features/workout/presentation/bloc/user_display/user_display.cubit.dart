import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/features/auth/domain/usecases/get_user.dart';
import 'package:iworkout/features/workout/presentation/bloc/user_display/user_display_state.dart';
import 'package:iworkout/service_locater.dart';


class UserDisplayCubit extends Cubit<UserDisplayState> {
  UserDisplayCubit() : super(UserLoading());

  void displayUser() async {
    var result = await sl<GetUserUseCase>().call();

    result.fold((error) {
      emit(LoadUserFailure(errorMessage: error.toString()));
    }, (data) {
      emit(UserLoaded(userEntity: data));
    });
  }
}