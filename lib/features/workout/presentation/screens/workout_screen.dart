import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/routes/app_router.gr.dart';
import 'package:iworkout/features/workout/presentation/bloc/workouts/workouts_cubit.dart';
import 'package:iworkout/features/workout/presentation/bloc/workouts/workouts_state.dart';
import 'package:iworkout/features/workout/presentation/screens/add_exercice.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entraînement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Séances d\'entraînement',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            BlocProvider(
              create: (context) => WorkoutsCubit()..execute(),
              child: BlocBuilder<WorkoutsCubit, WorkoutsState>(builder: (context, state) {
                if (state is WorkoutsLoading) {
                  return const Center(child: CircularProgressIndicator(color: Colors.white));
                } else if (state is WorkoutsLoadingFailure) {
                  return Center(child: Text(state.errorMessage));
                } else if (state is WorkoutsLoaded) {
                  return Expanded(
                    child: ListView(
                      children: state.workouts.map((workout) => _buildWorkoutCard('Séance ${workout.name}', workout.day, 5, context)).toList(),
                    ),
                  );
                }
                return const SizedBox();
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExerciseScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildWorkoutCard(
      String name, String day, int exercises, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Jour: $day'),
            Text('Exercices: $exercises'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                context.router.push(WorkoutDayRoute(id: 'id', day: 'Lundi'));
              },
              child: const Text('Voir détails'),
            ),
          ],
        ),
      ),
    );
  }
}
