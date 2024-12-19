import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iworkout/features/workout/domain/entities/workout.dart';

abstract class WorkoutApiService {
  Future<List<WorkoutItem>> getWorkoutByUserId(String userId);

  void deleteWorkout(String workoutId);
}

class WorkoutApiServiceImpl extends WorkoutApiService {
  static final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");

  static final CollectionReference _workoutsCollection =
      FirebaseFirestore.instance.collection("workouts");

  @override
  Future<List<WorkoutItem>> getWorkoutByUserId(String userId) async {
    DocumentReference userRef = _usersCollection.doc(userId);

    final workouts =
        await _workoutsCollection.where("user", isEqualTo: userRef).get();

    return workouts.docs.map((doc) => WorkoutItem.fromDocument(doc)).toList();
  }

  @override
  void deleteWorkout(String workoutId) {
    _workoutsCollection.doc(workoutId).delete();
  }
}
