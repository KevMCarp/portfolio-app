import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:service_status/components/car_animation.dart';
import 'package:service_status/components/dialogs/car_search_dialog.dart';
import 'package:service_status/components/outlined_text_field.dart';
import 'package:service_status/components/screen_layout.dart';
import 'package:service_status/routes/routes.dart';
import 'package:service_status/screens/status_screen.dart';
import 'package:service_status/utils/validators.dart';

import '../components/outlined_elevated_button.dart';
import '../components/scaffold.dart';
import '../constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String _reg = '';
  late GlobalKey<FormState> _formKey;
  late RiveAnimationController _controller;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'drive',
      autoplay: false,
    );
    _formKey = GlobalKey<FormState>();
  }

  void _start() async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      form.save();
      await showCarSeachDialog(context, _reg);
      _controller.isActive = true;
      setState(() {
        _isPlaying = true;
      });
      await Future.delayed(kTransitionDuration);
      pushReplacementRoute(context, const StatusScreen());
    }
  }

  Widget landscapeLayout({
    required Widget text,
    required Widget textField,
    required Widget car,
    required Widget button,
  }) {
    const spacer = SizedBox(height: 12);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                text,
                spacer,
                // kHeightSpacer,
                textField,
                spacer,
                button
              ],
            ),
          ),
        ),
        Expanded(
          child: car,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    final theme = Theme.of(context);

    final text = Text(
      'To check the status of your vehicle, please enter your registration number below.',
      style: theme.textTheme.subtitle1,
      textAlign: TextAlign.center,
    );

    final textField = SizedBox(
      width: 200,
      child: Form(
        key: _formKey,
        child: OutlinedTextField(
          onSaved: (value) => _reg = value ?? '',
          validator: (value) => Validators.registration(value),
          textStyle: const TextStyle(fontFamily: 'UKNumberPlate', fontSize: 28),
          keyboardType: TextInputType.visiblePassword,
          center: true,
        ),
      ),
    );

    final car = CarAnimation(
      isPlaying: _isPlaying,
      controller: _controller,
    );

    final button = OutlinedElevatedButton(
      onPressed: () => _start(),
      child: const Text('Let\'s get started'),
    );

    return ScreenLayout(
      title: 'Welcome to $kAppTitle',
      carAnimation: orientation == Orientation.portrait ? car : null,
      childPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      children: [
        if (orientation == Orientation.landscape)
          landscapeLayout(
            text: text,
            textField: textField,
            car: car,
            button: button,
          ),
        if (orientation == Orientation.portrait) ...[
          text,
          textField,
        ]
      ],
      footer: orientation == Orientation.portrait ? button : null,
    );
  }
}
