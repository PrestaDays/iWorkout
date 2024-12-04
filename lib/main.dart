import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iworkout/features/auth/presentation/pages/login_page.dart';
import 'package:iworkout/firebase_options.dart';
import 'package:iworkout/service_locater.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

   return const MaterialApp(
     title: "iWorkout",
      home: LoginPage()
    );
  }
}
