import 'package:flutter/material.dart';
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
            Expanded(
              child: ListView(
                children: [
                  _buildWorkoutCard('Séance Jambes', 'Lundi', 5),
                  _buildWorkoutCard('Séance Pectoraux', 'Mercredi', 4),
                  _buildWorkoutCard('Séance Dos', 'Vendredi', 6),
                ],
              ),
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

  Widget _buildWorkoutCard(String name, String day, int exercises) {
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
              onPressed: () {},
              child: const Text('Voir détails'),
            ),
          ],
        ),
      ),
    );
  }
}