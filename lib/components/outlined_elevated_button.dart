import 'package:flutter/material.dart';

class OutlinedElevatedButton extends StatelessWidget {
  const OutlinedElevatedButton(
      {required this.onPressed, required this.child, Key? key})
      : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(150, 45)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            theme.textTheme.button?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          )),
      onPressed: onPressed,
      child: child,
    );
  }
}
