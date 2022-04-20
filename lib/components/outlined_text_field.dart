import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({
    this.onSaved,
    this.validator,
    this.center = true,
    this.textStyle,
    this.keyboardType,
    Key? key,
  }) : super(key: key);

  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final bool center;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).textTheme.headline4!.color!;

    return TextFormField(
      onSaved: onSaved,
      textAlign: center ? TextAlign.center : TextAlign.start,
      validator: validator,
      style: textStyle,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: onPrimary),
          // gapPadding: ,
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
