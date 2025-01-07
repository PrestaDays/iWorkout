import 'package:flutter/services.dart';
import 'package:iworkout/core/common/widgets/inputs/combobox_single_select.dart';

class WorkoutEnvironmentWidget {
  final String HOMEGYM = "A la maison";
  final String GYM = "En salle de sport";

  const WorkoutEnvironmentWidget();

  ComboboxSingleSelect build() {
    List<String> environments = [
      HOMEGYM,
      GYM
    ];

    return ComboboxSingleSelect(
      hintText: "Environnement",
      options: environments,
    );
  }
}
