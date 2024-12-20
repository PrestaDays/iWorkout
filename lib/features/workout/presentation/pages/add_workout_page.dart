import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/common/blocs/button/button_cubit.dart';
import 'package:iworkout/core/common/widgets/buttons/primary_button.dart';
import 'package:iworkout/core/common/widgets/forms/text_input.dart';
import 'package:iworkout/core/common/widgets/inputs/combobox_single_select.dart';
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
  final TextEditingController _nameTextEditController = TextEditingController();
  String _weekDay = "";

  final List<String> weekDays = [
    "Lundi",
    "Mardi",
    "Mercredi",
    "Jeudi",
    "Vendredi",
    "Samedi",
    "Dimanche"
  ];

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
                      textController: _nameTextEditController,
                      validator: (String? value) =>
                          value != null && value.length < 5
                              ? "The text should be longer than 5 characters."
                              : null,
                      hintText: "Nom de le la séance",
                    ),
                    const SizedBox(height: 16),
                    ComboboxSingleSelect(
                      hintText: "Jour de la semaine",
                      options: weekDays,
                      onOptionSelected: (String value) {
                        _weekDay = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      useCubit: true,
                      onSuccess: () async {
                        await Future.delayed(const Duration(milliseconds: 300));

                        if (mounted) {
                          context.router.back();
                        }
                      },
                      onPressed: (context) async {
                        await context.read<ButtonStateCubit>().execute(
                              usecase: sl<CreateWorkoutUseCase>(),
                              params: CreateWorkoutsReqParams(
                                name: _nameTextEditController.text,
                                day: _weekDay,
                              ),
                            );
                      },
                      content: const Text("Créer ma séance"),
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
