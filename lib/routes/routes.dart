import 'package:flutter/material.dart';
import 'package:service_status/screens/welcome_screen.dart';

void pushReplacementRoute(BuildContext context, Widget newRoute) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (_) => newRoute,
    ),
  );
}

void pushRoute(BuildContext context, Widget newRoute) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => newRoute,
    ),
  );
}

void pushWelcomeRoute(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (_) => const WelcomePage(),
    ),
  );
}

void pop(BuildContext context) {
  Navigator.of(context).pop();
}
