import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iworkout/core/common/widgets/inputs/combobox_single_select.dart';
import 'package:iworkout/features/auth/presentation/widget/age_widget.dart';

@RoutePage()
class EnterUserInformationsPage extends StatelessWidget {
  const EnterUserInformationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    const AGE_MIN = 16;
    const AGE_MAX = 99;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Entrez vos informations'),
        ),
        body: Column(
          children: [
            AgeWidget(AGE_MIN: AGE_MIN, AGE_MAX: AGE_MAX).build()
          ],
        ));
  }
}
