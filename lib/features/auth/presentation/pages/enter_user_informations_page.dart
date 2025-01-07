import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/common/blocs/button/button_cubit.dart';
import 'package:iworkout/core/common/widgets/buttons/primary_button.dart';
import 'package:iworkout/features/auth/presentation/widget/age_widget.dart';
import 'package:iworkout/features/auth/presentation/widget/genre_widget.dart';
import 'package:iworkout/features/auth/presentation/widget/nb_workouts_days_per_week.dart';
import 'package:iworkout/features/auth/presentation/widget/workout_environment_widget.dart';
import 'package:moon_design/moon_design.dart';

@RoutePage()
class EnterUserInformationsPage extends StatelessWidget {
  const EnterUserInformationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    const ageMin = 16;
    const ageMax = 99;

    
    context.router.replace(const HomeRoute());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Entrez vos informations'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildSectionTitle('Age'),
              AgeWidget(AGE_MIN: AGE_MIN, AGE_MAX: AGE_MAX).build(),
              SizedBox(height: 40),
              _buildSectionTitle('Genre'),
              GenreWidget().build(),
              SizedBox(height: 40),
              _buildSectionTitle("Séances par semaine"),
              NbWorkoutsDaysPerWeek().build(),
              SizedBox(height: 40),
              _buildSectionTitle("Environnement de travail"),
              WorkoutEnvironmentWidget().build(),
              SizedBox(height: 40),
              BlocProvider(
                create: (context) => ButtonStateCubit(),
                child: PrimaryButton(
                    onPressed: () => {
                    }, 
                    content: Text('Envoyer')
                ),
              )
            ],
          ),
        ));
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Text(
      title,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70),
    ),
  );
}
