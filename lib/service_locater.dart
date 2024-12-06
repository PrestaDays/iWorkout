import 'package:get_it/get_it.dart';
import 'package:iworkout/features/auth/data/repositories/auth.dart';
import 'package:iworkout/features/auth/data/source/auth_firebase_service.dart';
import 'package:iworkout/features/auth/domain/repositories/auth.dart';
import 'package:iworkout/features/auth/domain/usecases/get_user.dart';
import 'package:iworkout/features/auth/domain/usecases/logout.dart';
import 'package:iworkout/features/auth/domain/usecases/signin_with_google.dart';
import 'package:iworkout/features/workout/data/repositories/workout.dart';
import 'package:iworkout/features/workout/data/source/workout_firebase_service.dart';
import 'package:iworkout/features/workout/domain/repositories/workout.dart';
import 'package:iworkout/features/workout/domain/usecases/get_workout.dart';


final sl = GetIt.instance;

void setupServiceLocator() {

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<WorkoutApiService>(WorkoutApiServiceImpl());

  // // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<WorkoutRepository>(WorkoutRepositoryImpl());

  // Usecases
  sl.registerSingleton<SigninWithGoogleUseCase>(SigninWithGoogleUseCase());
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetWorkoutUseCase>(GetWorkoutUseCase());

}