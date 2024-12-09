import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';


@RoutePage()
class WorkoutDayPage extends StatelessWidget {
  final String id;
  final String day;

  const WorkoutDayPage({super.key, required this.id, required this.day});

  @override
  Widget build(BuildContext context) {
    return const Text("WorkoutDayScreen");
  }
}
