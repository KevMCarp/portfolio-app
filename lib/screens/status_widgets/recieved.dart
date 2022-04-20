import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:service_status/components/outlined_elevated_button.dart';
import 'package:service_status/components/screen_layout.dart';
import 'package:service_status/constants.dart';
import 'package:service_status/routes/routes.dart';

const _vehicleRecieved =
    'Your vehicle has been recieved and is awaiting one of our expert tehchnicians.';
const _checkBack = 'Please check back later!';
const _estimatedCompletion = 'Estimated completion time';

class RecievedScreen extends StatelessWidget {
  const RecievedScreen({
    required this.timestamp,
    Key? key,
  }) : super(key: key);

  final DateTime timestamp;

  Widget landscapeLayout({
    required TextStyle bodyStyle,
    required TextStyle dateStyle,
    required TextStyle timeStyle,
    required String date,
    required String time,
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
                  _vehicleRecieved,
                  textAlign: TextAlign.center,
                  style: bodyStyle,
                ),
                kHeightSpacer,
                kHeightSpacer,
                Text(
                  _checkBack,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: timeStyle,
                // style: textTheme.headline1,
              ),
              const Text(_estimatedCompletion),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> portraitLayout({
    required TextStyle bodyStyle,
    required TextStyle dateStyle,
    required TextStyle timeStyle,
    required String date,
    required String time,
  }) {
    return [
      Text(
        _vehicleRecieved,
        style: bodyStyle,
        textAlign: TextAlign.center,
      ),
      kHeightSpacer,
      Text(
        time,
        style: timeStyle,
        // style: textTheme.headline1,
      ),
      const Text(_estimatedCompletion),
      kHeightSpacer,
      Text(
        _checkBack,
        style: bodyStyle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    final textTheme = Theme.of(context).textTheme;
    final bodyStyle = textTheme.bodyText1!.copyWith(fontSize: 18);

    final date = DateFormat('dd/MM/yyyy').format(timestamp);
    final time = DateFormat('hh:mm').format(timestamp);

    return ScreenLayout(
      title: 'Recieved',
      // childMainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (media.orientation == Orientation.landscape)
          landscapeLayout(
            bodyStyle: bodyStyle,
            dateStyle: textTheme.headline4!,
            timeStyle: textTheme.headline1!,
            date: date,
            time: time,
          ),
        if (media.orientation == Orientation.portrait)
          ...portraitLayout(
            bodyStyle: bodyStyle,
            dateStyle: textTheme.headline4!,
            timeStyle: textTheme.headline1!,
            date: date,
            time: time,
          ),
      ],
      footer: OutlinedElevatedButton(
        onPressed: () {
          pushWelcomeRoute(context);
        },
        child: const Text('Back'),
      ),
    );
  }
}
