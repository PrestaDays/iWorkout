import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iworkout/features/workout/data/models/create_workouts_req_params.dart';
import 'package:iworkout/features/workout/domain/entities/workout.dart';

abstract class WorkoutApiService {
  Future<List<WorkoutItem>> getWorkoutByUserId(String userId);

  void deleteWorkout(String workoutId);

  void createWorkout(String userId, CreateWorkoutsReqParams param);
}

class WorkoutApiServiceImpl extends WorkoutApiService {
  static final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");

  static final CollectionReference _workoutsCollection =
      FirebaseFirestore.instance.collection("workouts");

  static final CollectionReference _exercisesCollection =
  FirebaseFirestore.instance.collection("exercices");

  static final userRef = _usersCollection.doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Future<List<WorkoutItem>> getWorkoutByUserId(String userId) async {
    DocumentReference userRef = _usersCollection.doc(userId);

    final workouts =
        await _workoutsCollection
            .where("user", isEqualTo: userRef)
            .get();

    return workouts.docs.map((doc) => WorkoutItem.fromDocument(doc)).toList();
  }

  @override
  void deleteWorkout(String workoutId) {
    _workoutsCollection.doc(workoutId).delete();
  }

  @override
  Future<void> createWorkout(String userId, CreateWorkoutsReqParams param) async {
    DocumentReference userRef = _usersCollection.doc(userId);

    List<DocumentReference> exerciseRefs = [];

    DocumentReference exerciseRef = await _exercisesCollection.add({
      "name": "Default Exercise",
      "sets": 3,
      "reps": 10,
    });

    exerciseRefs.add(exerciseRef);

    await _workoutsCollection.doc().set({
      "user": userRef,
      "day": param.day,
      "exercices": exerciseRefs,  // Store array of DocumentReferences
      "name": param.name,
    });
  }
}
