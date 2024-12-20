import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iworkout/core/common/blocs/button/button_cubit.dart';
import 'package:iworkout/core/common/blocs/button/button_state.dart';
import 'package:iworkout/core/common/widgets/buttons/secondary_button.dart';
import 'package:iworkout/core/routes/app_router.gr.dart';
import 'package:iworkout/features/auth/domain/usecases/signin_with_google.dart';
import 'package:iworkout/service_locater.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 64),
                Image.asset(
                  'assets/icons/icon.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 32),
                // Welcome Text
                const Text(
                  'Welcome to iWorkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Sign in to start your fitness journey',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                BlocProvider(
                  create: (context) => ButtonStateCubit(),
                  child: BlocListener<ButtonStateCubit, ButtonState>(
                    listener: (context, state) {
                      if (state is ButtonSuccessState) {
                        print("HEREEE");
                        context.router.replace(const HomeRoute());
                        return;
                      }
                      if (state is ButtonFailureState) {
                        var snackBar =
                            SnackBar(content: Text(state.errorMessage));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: SafeArea(
                      minimum:
                          const EdgeInsets.only(top: 50, right: 16, left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _createGoogleAccountButton(context),
                          const SizedBox(height: 20),
                          // _createAppleAccountButton(context)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createGoogleAccountButton(BuildContext context) {
    return Builder(builder: (context) {
      return SecondaryButton(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/google_logo.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 16),
              const Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          onPressed: () {
            context.read<ButtonStateCubit>().execute(
                  usecase: sl<SigninWithGoogleUseCase>(),
                );
          });
    });
  }

  Widget _createAppleAccountButton(BuildContext context) {
    return Builder(builder: (context) {
      return SecondaryButton(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/apple_logo.svg',
                width: 24,
                height: 24,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              const SizedBox(width: 16),
              const Text(
                'Sign in with Apple',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          onPressed: () {
            throw UnimplementedError("Sign in with Apple is not implemented");
            // context.read<ButtonStateCubit>().excute(
            //       usecase: sl<SigninWithGoogleUseCase>(),
            //     );
          });
    });
  }
}
