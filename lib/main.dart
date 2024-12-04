import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iworkout/core/configs/themes/dark_theme.dart';
import 'package:iworkout/core/routes/app_router.dart';
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

    final appRouter = AppRouter();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: darkTheme,
      title: 'Jealousy',
    );
  }
}
