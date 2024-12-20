import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/common/widgets/buttons/primary_button.dart';
import 'package:iworkout/core/common/widgets/moon_confirm_dialog.dart';
import 'package:iworkout/core/routes/app_router.gr.dart';
import 'package:iworkout/features/workout/domain/entities/workout.dart';
import 'package:iworkout/features/workout/presentation/bloc/workouts/workouts_bloc.dart';
import 'package:iworkout/features/workout/presentation/bloc/workouts/workouts_event.dart';
import 'package:iworkout/features/workout/presentation/bloc/workouts/workouts_state.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutsBloc()..add(FetchWorkouts()),
      child: const WorkoutView(),
    );
  }
}

class WorkoutView extends StatefulWidget {
  const WorkoutView({super.key});

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
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
              'Vos séances d\'entraînement',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            BlocBuilder<WorkoutsBloc, WorkoutsState>(
                builder: (context, state) {
                  if (state is WorkoutsLoading) {
                    return const Center(
                        child: CircularProgressIndicator(color: Colors.white)
                    );
                  } else if (state is WorkoutsLoadingFailure) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is WorkoutsLoaded) {
                    if (state.workouts.isEmpty) {
                      return const Center(
                        child: Text('Aucune séance d\'entraînement'),
                      );
                    }

                    return Expanded(
                      child: ListView(
                        children: state.workouts
                            .map((workoutItem) => _buildWorkoutCard(workoutItem, context))
                            .toList(),
                      ),
                    );
                  }
                  return const SizedBox();
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.router.push(const AddWorkoutRoute());
          if (!mounted) return;

          context.read<WorkoutsBloc>().add(FetchWorkouts());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildWorkoutCard(WorkoutItem workoutItem, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Séance ${workoutItem.name}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return ConfirmDialog(
                          title: 'Confirmation',
                          content: 'Veux-tu vraiment supprimer cette séance?',
                          onConfirm: () {
                            context.read<WorkoutsBloc>().add(
                              DeleteWorkout(workoutId: workoutItem.id),
                            );
                            Navigator.of(dialogContext).pop();
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            Text('Jour: ${workoutItem.day}'),
            Text('Exercices: ${workoutItem.nbrOfExercice}'),
            const SizedBox(height: 8),
            PrimaryButton(
              onPressed: (context) {
                context.router.push(
                    WorkoutDayRoute(id: workoutItem.id, day: workoutItem.day)
                );
              },
              content: const Text('Détails'),
              leading: const Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }
}