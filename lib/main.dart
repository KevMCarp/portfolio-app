import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/welcome_screen.dart';
import 'theme/theme.dart';
import 'utils/focus_remover.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      home: const WelcomePage(),
      builder: (context, child) => GestureDetector(
        onTap: () {
          removeFocus(context);
        },
        child: child,
      ),
    );
  }
}
