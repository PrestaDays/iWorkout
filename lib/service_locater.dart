import 'package:get_it/get_it.dart';
import 'package:iworkout/features/auth/data/repositories/auth.dart';
import 'package:iworkout/features/auth/data/source/auth_firebase_service.dart';
import 'package:iworkout/features/auth/domain/repositories/auth.dart';
import 'package:iworkout/features/auth/domain/usecases/get_user.dart';
import 'package:iworkout/features/auth/domain/usecases/logout.dart';
import 'package:iworkout/features/auth/domain/usecases/signin_with_google.dart';
import 'package:iworkout/features/workout/data/repositories/workout_day.dart';
import 'package:iworkout/features/workout/domain/repositories/workout_day.dart';
import 'package:iworkout/features/workout/domain/usecases/get_workout_day.dart';


final sl = GetIt.instance;

void setupServiceLocator() {

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<WorkoutDayRepository>(WorkoutDayRepositoryImpl());

  // Usecases
  sl.registerSingleton<SigninWithGoogleUseCase>(SigninWithGoogleUseCase());
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetWorkoutDayUseCase>(GetWorkoutDayUseCase());
}