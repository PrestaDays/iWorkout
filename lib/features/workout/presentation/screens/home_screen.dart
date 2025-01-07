import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/common/widgets/buttons/primary_button.dart';
import 'package:iworkout/features/workout/presentation/bloc/user_display/user_display.cubit.dart';
import 'package:iworkout/features/workout/presentation/bloc/user_display/user_display_state.dart';
import 'package:moon_design/moon_design.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Text("Aujourd'hui c'est repos"),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocProvider(
                create: (context) => UserDisplayCubit()..displayUser(),
                child: BlocBuilder<UserDisplayCubit, UserDisplayState>(
                    builder: (context, state) {
                  if (state is UserLoading) {
                    return const SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(color: Colors.white));
                  }

                  if (state is UserLoaded) {
                    return Text(
                      'Bienvenue, ${state.userEntity.displayName}!',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    );
                  }

                  if (state is LoadUserFailure) {
                    return Text(state.errorMessage);
                  }

                  return const Text("This should never happen");
                })),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Prochain entraînement',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text for the title
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Séance Jambes',
                      style: TextStyle(
                        color: Colors
                            .grey[300], // Light grey for better readability
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Increased spacing before the button
                    PrimaryButton(
                      onPressed: (_) async {
                        // Navigate to the workout screen
                        // context.router.push(const WorkoutRoute());
                      },
                      buttonSize: MoonButtonSize.lg,
                      content: const Text('Commencer'),
                      leading: const Icon(Icons.play_arrow),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Statistiques récentes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildStatCard(context, 'Séances cette semaine', '3'),
                  _buildStatCard(context, 'Total de poids soulevé', '2500 kg'),
                  _buildStatCard(
                      context, 'Exercice le plus fort', 'Squat - 100 kg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
            Text(value, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
