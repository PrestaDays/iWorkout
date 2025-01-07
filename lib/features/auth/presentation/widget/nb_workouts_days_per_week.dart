import 'package:flutter/services.dart';
import 'package:iworkout/core/common/widgets/inputs/combobox_single_select.dart';

class NbWorkoutsDaysPerWeek {
  const NbWorkoutsDaysPerWeek();

  ComboboxSingleSelect build() {
    List<String> NbWorkoutsDaysPerWeek = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7"
    ];

    return ComboboxSingleSelect(
      hintText: "Nombre de séances par semaine",
      options: NbWorkoutsDaysPerWeek,
      formatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
