import 'package:flutter/material.dart';

import '../../components/date_time_text.dart';
import '../../components/outlined_elevated_button.dart';
import '../../components/screen_layout.dart';
import '../../constants.dart';
import '../../routes/routes.dart';

const _vehicleRecieved =
    'Your vehicle has been recieved and is awaiting one of our expert technicians.';
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
          child: DateTimeText(
            timestamp: timestamp,
            caption: _estimatedCompletion,
          ),
        ),
      ],
    );
  }

  List<Widget> portraitLayout({
    required TextStyle bodyStyle,
  }) {
    return [
      Text(
        _vehicleRecieved,
        style: bodyStyle,
        textAlign: TextAlign.center,
      ),
      kHeightSpacer,
      DateTimeText(
        timestamp: timestamp,
        caption: _estimatedCompletion,
      ),
      kHeightSpacer,
      Text(
        _checkBack,
        style: bodyStyle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyStyle = textTheme.bodyText1!.copyWith(fontSize: 18);

    return ScreenLayout(
      title: 'Recieved',
      portraitBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: portraitLayout(bodyStyle: bodyStyle),
          ),
        );
      },
      landscapeBuilder: (context) {
        return landscapeLayout(bodyStyle: bodyStyle);
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
