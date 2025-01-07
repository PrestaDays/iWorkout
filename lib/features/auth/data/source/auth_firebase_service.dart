import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthApiService {
  Future<Either> signInWithGoogle();

  Future<Either> getUser();

  bool isLoggedIn();

  Future<Either> logout();
}

class AuthApiServiceImpl extends AuthApiService {
  static User? user = FirebaseAuth.instance.currentUser;

  static final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection("users");

  @override
  Future<Either> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        throw AssertionError('Failed to sign in with Google');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null && googleAuth.idToken == null) {
        throw AssertionError('At least one of ID token and access token is required');
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      await _setUserInFirestore(userCredential.user);
      return Right(userCredential.user);
    } catch (e) {
      return Left(e);
    }
  }

  static Future<void> _setUserInFirestore(User? user) async {
    if (user == null) return;

    final docSnapshot = await _usersCollection.doc(user.uid).get();

    if (!docSnapshot.exists) {
      await _usersCollection.doc(user.uid).set({
        'email': user.email,
        'lastLogin': FieldValue.serverTimestamp(),
      });
    } else {
      await _usersCollection.doc(user.uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Future<Either> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return const Right(true);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getUser() async {
    if (user != null) {
      return Right(user);
    }
    return const Left(null);
  }

  @override
  bool isLoggedIn() {
    return user != null;
  }
}