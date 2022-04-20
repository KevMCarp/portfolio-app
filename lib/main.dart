import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_status/theme/theme.dart';

import 'constants.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    print(now);

    return MaterialApp(
      title: 'Service',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      home: const WelcomePage(),
      builder: (context, child) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: child,
      ),
    );
  }
}
