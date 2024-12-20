import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/common/blocs/button/button_cubit.dart';
import 'package:iworkout/core/common/blocs/button/button_state.dart';
import 'package:iworkout/core/configs/themes/dark_theme.dart';
import 'package:moon_design/moon_design.dart';

typedef ButtonCallback = void Function();
typedef ButtonContextCallback = void Function(BuildContext context);

class PrimaryButton extends StatelessWidget {
  final dynamic onPressed;  // Can accept either ButtonCallback or ButtonContextCallback
  final Widget content;
  final Widget? leading;
  final Widget? trailing;
  final MoonButtonSize? buttonSize;
  final bool? useCubit;

  final VoidCallback onSuccess;

  const PrimaryButton({
    required this.onPressed,
    required this.content,
    this.buttonSize = MoonButtonSize.md,
    this.useCubit = false,
    this.onSuccess = _defaultOnSuccess,
    this.leading,
    this.trailing,
    super.key
  }) : assert(
  onPressed is ButtonCallback || onPressed is ButtonContextCallback,
  'onPressed must be either a simple callback or a callback taking BuildContext'
  );

  static void _defaultOnSuccess() {}

  @override
  Widget build(BuildContext context) {
    if (useCubit!) {
      return BlocProvider<ButtonStateCubit>(
        create: (context) => ButtonStateCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<ButtonStateCubit, ButtonState>(
            builder: (context, state) {
              if (state is ButtonLoadingState) {
                return _loading(context);
              }
              if (state is ButtonSuccessState) {
                onSuccess();
              }
              return _initial(context);
            },
          ),
        ),
      );
    }

    return _initial(context);
  }

  Widget _loading(BuildContext context) {
    return MoonFilledButton(
      buttonSize: buttonSize,
      onTap: null,
      leading: null,
      label: const CircularProgressIndicator(
        color: Colors.white,
      ),
      trailing: null,
    );
  }

  Widget _initial(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: PurpleMoonColor.withOpacity(0.8),
              offset: const Offset(0, 5),
              blurRadius: 17,
            )
          ]
      ),
      child: MoonFilledButton(
        buttonSize: buttonSize,
        onTap: () async {
          if (onPressed is ButtonContextCallback) {
            (onPressed as ButtonContextCallback)(context);
          } else {
            (onPressed as ButtonCallback)();
          }
        },
        leading: leading,
        label: content,
        trailing: trailing,
      ),
    );
  }
}