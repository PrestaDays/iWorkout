import 'package:flutter/cupertino.dart';
import 'package:moon_design/moon_design.dart';

class TextInput extends StatelessWidget {

  final TextEditingController textController;
  final FormFieldValidator<String> validator;
  final String hintText;

  final Widget leading;
  final Widget trailing;

  const TextInput({
    required this.textController,
    required this.validator,
    this.hintText = "",
    this.leading = const SizedBox(),
    this.trailing = const SizedBox(),
    super.key
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MoonFormTextInput(
      backgroundColor: MoonColors.dark.goku,
      textColor: MoonColors.dark.bulma,
      hintText: hintText,
      controller: textController,
      validator: validator,
      onTap: () => textController.clear(),
      leading: leading,
      trailing: trailing,
    );
  }
}
