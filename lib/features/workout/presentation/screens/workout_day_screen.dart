import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/features/workout/presentation/bloc/workout_day/workout_day_cubit.dart';
import 'package:iworkout/features/workout/presentation/bloc/workout_day/workout_day_event.dart';
import 'package:iworkout/features/workout/presentation/bloc/workout_day/workout_day_state.dart';

class WorkoutDayScreen extends StatelessWidget {
  const WorkoutDayScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context) => WorkoutDayBloc(),
        child: BlocBuilder<WorkoutDayBloc, WorkoutDayState>(builder: (context, state) {
          print("state $state");
          return ElevatedButton(onPressed: () {
            context.read<WorkoutDayBloc>().add(AddWorkoutExec(exec: "exec"));
          }, child: const Text("click me"));
        })
    );
  }
  
}

