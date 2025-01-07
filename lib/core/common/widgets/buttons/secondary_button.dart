import 'package:flutter/material.dart';
import 'package:iworkout/core/configs/themes/dark_theme.dart';
import 'package:moon_design/moon_design.dart';

class SecondaryButton extends StatelessWidget {
  final void Function(BuildContext) onPressed;
  final Widget content;
  final Widget? leading;
  final Widget? trailing;
  final MoonButtonSize? buttonSize;

  const SecondaryButton({
    required this.onPressed,
    required this.content,
    this.buttonSize = MoonButtonSize.md,
    this.leading,
    this.trailing,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MoonOutlinedButton(
      borderColor: PurpleMoonColor,
      buttonSize: buttonSize,
      onTap: () {
        onPressed(context);
      },
      leading: leading,
      label: content,
      trailing: trailing,
    );
  }
}