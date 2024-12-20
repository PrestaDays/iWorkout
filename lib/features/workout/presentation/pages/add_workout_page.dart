import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/common/blocs/button/button_cubit.dart';
import 'package:iworkout/core/common/widgets/buttons/primary_button.dart';
import 'package:iworkout/core/common/widgets/forms/text_input.dart';
import 'package:iworkout/features/workout/data/models/create_workouts_req_params.dart';
import 'package:iworkout/features/workout/domain/usecases/create_workout.dart';
import 'package:iworkout/service_locater.dart';

@RoutePage()
class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({super.key});

  @override
  State<AddWorkoutPage> createState() => _AddWorkoutScreenState();
}


class _AddWorkoutScreenState extends State<AddWorkoutPage> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ajouter un exercice'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Builder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    TextInput(
                      leading: const Icon(Icons.search, color: Colors.white),
                      textController: _textController,
                      validator: (String? value) =>
                          value != null && value.length < 5
                              ? "The text should be longer than 5 characters."
                              : null,
                      hintText: "Nom de le la séance",
                    ),

                    TextInput(
                      leading: const Icon(Icons.search, color: Colors.white),
                      textController: _editingController,
                      validator: (String? value) =>
                      value != null && value.length < 5
                          ? "The text should be longer than 5 characters."
                          : null,
                      hintText: "Jour de la séance",
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                        useCubit: true,
                        onSuccess: () {
                          context.router.back();
                        },
                        onPressed: (context) {

                          BlocProvider.of<ButtonStateCubit>(context).execute(
                            usecase: sl<CreateWorkoutUseCase>(),
                            params: CreateWorkoutsReqParams(name: _textController.text, day: _editingController.text),
                          );

                        },
                        content: const Text("Créer ma séance")
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}

