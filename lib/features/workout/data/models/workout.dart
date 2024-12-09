import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  final String day;
  final String name;

  Workout({
    required this.day,
    required this.name,
  });

  factory Workout.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Workout(
      day: data['day'],
      name: data['name'],
    );
  }

}
