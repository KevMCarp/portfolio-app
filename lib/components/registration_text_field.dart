import 'package:flutter/material.dart';
import 'package:service_status/constants.dart';

const _errorStyle = TextStyle(color: Colors.red);

class RegistrationTextField extends StatefulWidget {
  const RegistrationTextField({
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
  State<RegistrationTextField> createState() => _RegistrationTextFieldState();
}

class _RegistrationTextFieldState extends State<RegistrationTextField> {
  String? _validator;

  String? _validate(String value) {
    if (widget.validator != null) {
      final valid = widget.validator!(value);
      setState(() {
        _validator = valid;
      });

      return valid;
    }
    return null;
  }

  double _textHeight() {
    assert(_validator != null);

    final text = TextPainter(
      text: TextSpan(
        text: _validator,
        style: _errorStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    text.layout();
    return text.height + 6;
  }

  @override
  Widget build(BuildContext context) {
    final onPrimary = Theme.of(context).textTheme.headline4!.color!;
    const radius = Radius.circular(15);
    const borderRadius = BorderRadius.only(
      topRight: radius,
      bottomRight: radius,
      topLeft: Radius.zero,
      bottomLeft: Radius.zero,
    );

    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:
              EdgeInsets.only(bottom: _validator == null ? 0 : _textHeight()),
          child: Container(
            width: 30,
            height: 60,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: radius,
                topRight: Radius.zero,
                bottomLeft: radius,
                bottomRight: Radius.zero,
              ),
            ),
            child: const Center(
              child: Text(
                '🇬🇧\nUK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            onSaved: widget.onSaved,
            textAlign: widget.center ? TextAlign.center : TextAlign.start,
            validator: (value) => _validate(value ?? ''),
            style: widget.textStyle,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              // prefix: Container(width: 40, height: 50, color: Colors.blue),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: onPrimary),
                // gapPadding: ,
                borderRadius: borderRadius,
              ),
              errorStyle: _errorStyle,
              border: const OutlineInputBorder(
                borderRadius: borderRadius,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
