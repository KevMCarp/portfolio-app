import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../components/car_animation.dart';
import '../components/outlined_elevated_button.dart';
import '../components/registration_text_field.dart';
import '../components/screen_layout.dart';
import '../constants.dart';
import '../routes/routes.dart';
import '../utils/focus_remover.dart';
import '../utils/validators.dart';
import 'status_screen.dart';

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

  void _start({required VoidCallback onComplete}) async {
    final form = _formKey.currentState!;

    if (form.validate()) {
      //Close keyboard if open.
      removeFocus(context);
      //Save registration
      form.save();

      //Wait for car animation to complete
      _controller.isActive = true;
      setState(() {
        _isPlaying = true;
      });
      await Future.delayed(kTransitionDuration);

      //Push to status screen and pass vehicle registration
      onComplete();
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
        child: RegistrationTextField(
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
      onInit: (_) => setState(() {}),
    );

    final button = OutlinedElevatedButton(
      onPressed: () => _start(
        onComplete: () => pushReplacementRoute(
          context,
          StatusScreen(
            vehicleRegistration: _reg,
          ),
        ),
      ),
      child: const Text('Let\'s get started'),
    );

    return ScreenLayout(
      title: 'Welcome to $kAppTitle',
      portraitBuilder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            car,
            text,
            textField,
          ],
        );
      },
      landscapeBuilder: (context) {
        return landscapeLayout(
          text: text,
          textField: textField,
          car: car,
          button: button,
        );
      },
      footer: orientation == Orientation.portrait ? button : null,
    );
  }
}
