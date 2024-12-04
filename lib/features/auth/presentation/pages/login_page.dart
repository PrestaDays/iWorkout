import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/common/blocs/button/button_cubit.dart';
import 'package:iworkout/core/common/blocs/button/button_state.dart';
import 'package:iworkout/core/common/widgets/buttons/primary_button.dart';
import 'package:iworkout/features/auth/domain/usecases/signin_with_google.dart';
import 'package:iworkout/service_locater.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              print("LOGIBBBBBBB");
              //context.router.replace(const HomeRoute());
            }
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _createAccountButton(context),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _createAccountButton(BuildContext context) {
    return Builder(builder: (context) {
      return PrimaryButton(
          title: 'Login with google',
          onPressed: () {
            context.read<ButtonStateCubit>().excute(
              usecase: sl<SigninWithGoogleUseCase>(),
            );
          });
    });
  }
}

