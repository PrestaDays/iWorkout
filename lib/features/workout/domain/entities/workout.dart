import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  final String id;
  final String day;
  final String name;

  Workout({
    required this.id,
    required this.day,
    required this.name,
  });

  factory Workout.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Workout(
      id: doc.id,
      day: data['day'],
      name: data['name'],
    );
  }

}


class WorkoutItem extends Workout {
  final int nbrOfExercice;

  WorkoutItem({
    required this.nbrOfExercice, required super.day, required super.name, required super.id,
  });


  factory WorkoutItem.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WorkoutItem(
      id: doc.id,
      day: data['day'],
      name: data['name'],
      nbrOfExercice: data['exercices'].length,
    );
  }
}