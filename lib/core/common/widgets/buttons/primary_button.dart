import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget content;
  final Widget? leading;
  final Widget? trailing;
  final MoonButtonSize? buttonSize;

  const PrimaryButton({
    required this.onPressed,
    required this.content,
    this.buttonSize = MoonButtonSize.md,
    this.leading,
    this.trailing,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MoonFilledButton(
      buttonSize: buttonSize,
      onTap: onPressed,
      leading: leading,
      label: content,
      trailing: trailing,
    );
  }
}