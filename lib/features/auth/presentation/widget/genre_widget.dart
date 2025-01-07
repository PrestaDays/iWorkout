import 'package:flutter/services.dart';
import 'package:iworkout/core/common/widgets/inputs/combobox_single_select.dart';

class GenreWidget {
  final String MALE = "Homme";
  final String FEMALE = "Femme";

  const GenreWidget();

  ComboboxSingleSelect build() {
    List<String> genres = [
      MALE,
      FEMALE
    ];

    return ComboboxSingleSelect(
      hintText: "Sexe",
      options: genres,
      formatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
