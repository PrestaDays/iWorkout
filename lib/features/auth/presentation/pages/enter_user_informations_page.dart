import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iworkout/core/routes/app_router.gr.dart';
import 'package:iworkout/features/auth/presentation/widget/age_widget.dart';

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
        body: Column(
          children: [
            const AgeWidget(AGE_MIN: ageMin, AGE_MAX: ageMax).build()
          ],
        ));
  }
}
