import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iworkout/core/common/blocs/button/button_cubit.dart';
import 'package:iworkout/core/common/blocs/button/button_state.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget content;
  final double? height;
  final double? width;

  const SecondaryButton({
    required this.onPressed,
    required this.content,
    this.height,
    this.width,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loading(context);
        }
        return _initial(context);
      },
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width ?? MediaQuery.of(context).size.width, height ?? 60),
            elevation: 0,
            side: BorderSide(color: const Color(0xff3461FD), width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const CircularProgressIndicator(
            color: Colors.white,
          )
    );
  }

  Widget _initial(BuildContext context) {
    return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xff3461FD), backgroundColor: Colors.transparent,
            minimumSize: Size(width ?? MediaQuery.of(context).size.width, height ?? 60),
            elevation: 0,
            side: BorderSide(color: const Color(0xff3461FD), width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: content
      );
  }
}