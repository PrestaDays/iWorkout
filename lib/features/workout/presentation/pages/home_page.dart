import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iworkout/features/workout/presentation/screens/home_screen.dart';
import 'package:iworkout/features/workout/presentation/screens/profile_screen.dart';

import 'package:iworkout/features/workout/presentation/screens/progress_screen.dart';
import 'package:iworkout/features/workout/presentation/screens/workout_screen.dart';
import 'package:iworkout/features/workout/presentation/widgets/floating_bottom_navigation_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = const [
     HomeScreen(),
     WorkoutScreen(),
     ProgressScreen(),
    //ajout profil
     ProfileScreen(),

  ];

  void onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar:
            FloatingBottomNavigationBar(onItemTapped: onItemTapped)
    );
  }
}
