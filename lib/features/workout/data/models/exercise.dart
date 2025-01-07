import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  final String name;
  final int reps;
  final int sets;

  Exercise({
    required this.name,
    required this.sets,
    required this.reps,
  });

  factory Exercise.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Exercise(
      name: data['name'],
      sets: data['sets'],
      reps: data['reps'],
    );
  }

}
