import 'package:flutter/services.dart';
import 'package:iworkout/core/common/widgets/inputs/combobox_single_select.dart';

class AgeWidget {
  final int AGE_MIN;
  final int AGE_MAX;

  const AgeWidget({
    this.AGE_MIN = 1,
    this.AGE_MAX = 99,
  });

  ComboboxSingleSelect build() {
    int arrayLength = AGE_MAX - AGE_MIN + 1;

    List<String> ages =
        List.generate(arrayLength, (index) => (AGE_MIN + index).toString());

    return ComboboxSingleSelect(
      hintText: "Âge",
      options: ages,
      formatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
