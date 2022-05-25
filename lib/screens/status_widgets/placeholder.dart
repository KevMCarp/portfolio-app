import 'package:flutter/material.dart';

import '../../components/outlined_elevated_button.dart';
import '../../components/screen_layout.dart';
import '../../routes/routes.dart';

class StatusPlaceholder extends StatelessWidget {
  const StatusPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: 'Booked',
      portraitBuilder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text('Placeholder')],
        );
      },
      landscapeBuilder: (context) {
        return Column(
          children: const [
            Text('Placeholder'),
          ],
        );
      },
      footer: OutlinedElevatedButton(
        onPressed: () {
          pushWelcomeRoute(context);
        },
        child: const Text('Back'),
      ),
    );
  }
}
