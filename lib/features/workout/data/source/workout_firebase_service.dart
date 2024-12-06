import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iworkout/features/workout/domain/entities/workout.dart';

abstract class WorkoutApiService {
  Future<List<Workout>> getWorkoutByUserId(String userId);

}

class WorkoutApiServiceImpl extends WorkoutApiService {

  static final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection("users");

  static final CollectionReference _workoutsCollection =
  FirebaseFirestore.instance.collection("workouts");


  @override
  Future<List<Workout>> getWorkoutByUserId(String userId) async {
    DocumentReference userRef = _usersCollection.doc(userId);

    final workouts = await _workoutsCollection
        .where("user", isEqualTo: userRef)
        .get();

    return workouts.docs.map((doc) => Workout.fromDocument(doc)).toList();
  }

}