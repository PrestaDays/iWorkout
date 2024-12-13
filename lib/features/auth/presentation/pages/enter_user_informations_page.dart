import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iworkout/core/common/widgets/inputs/combobox_single_select.dart';

@RoutePage()
class EnterUserInformationsPage extends StatelessWidget {
  const EnterUserInformationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    const AGE_MIN = 16;
    const AGE_MAX = 90;
    const arrayLength = AGE_MAX - AGE_MIN + 1;

    List<String> ages =
        List.generate(arrayLength, (index) => (16 + index).toString());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Entrez vos informations'),
        ),
        body: Column(
          children: [
            ComboboxSingleSelect(
              options: ages,
              formatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
            )
          ],
        ));
  }
}
