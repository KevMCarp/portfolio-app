import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rive/rive.dart';

import '../../components/car_animation.dart';
import '../../components/outlined_elevated_button.dart';
import '../../components/screen_layout.dart';
import '../../constants.dart';
import '../../routes/routes.dart';

const _vehicleStatus = 'Your vehicle is ready for collection.';
const _collectionMessage = 'We look forward too seeing you!';

class ReadyScreen extends StatefulWidget {
  const ReadyScreen({Key? key}) : super(key: key);

  @override
  State<ReadyScreen> createState() => _ReadyScreenState();
}

class _ReadyScreenState extends State<ReadyScreen> {
  late RiveAnimationController _controller;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'drive',
      autoplay: true,
    );
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _startCar();
    });
  }

  void _startCar() async {
    // _isPlaying = true;
    setState(() {
      _isPlaying = true;
    });

    await Future.delayed(kTransitionDuration);
    _controller.isActive = false;
    setState(() {});
  }

  Widget landscapeLayout({
    required TextStyle bodyStyle,
    required Widget car,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _vehicleStatus,
                  textAlign: TextAlign.center,
                  style: bodyStyle,
                ),
                kHeightSpacer,
                kHeightSpacer,
                Text(
                  _collectionMessage,
                  style: bodyStyle,
                ),
              ],
            ),
          ),
        ),
        Container(
          color: kPrimaryColor,
          width: 0.5,
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
        Expanded(
          child: car,
        ),
      ],
    );
  }

  List<Widget> portraitLayout({
    required TextStyle bodyStyle,
    required Widget car,
  }) {
    return [
      Text(
        _vehicleStatus,
        style: bodyStyle,
        textAlign: TextAlign.center,
      ),
      kHeightSpacer,
      car,
      kHeightSpacer,
      Text(
        _collectionMessage,
        style: bodyStyle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyStyle = textTheme.bodyText1!.copyWith(fontSize: 18);

    final car = CarAnimation(
      reverse: true,
      isPlaying: _isPlaying,
      controller: _controller,
      onInit: (_) => setState(() {}),
    );

    return ScreenLayout(
      title: 'Ready',
      portraitBuilder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: portraitLayout(
            bodyStyle: bodyStyle,
            car: car,
          ),
        );
      },
      landscapeBuilder: (context) {
        return landscapeLayout(
          bodyStyle: bodyStyle,
          car: car,
        );
      },
      footer: OutlinedElevatedButton(
        onPressed: () {
          pop(context);
        },
        child: const Text('Back'),
      ),
    );
  }
}
