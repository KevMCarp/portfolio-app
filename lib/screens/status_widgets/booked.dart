import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:service_status/components/outlined_elevated_button.dart';
import 'package:service_status/components/screen_layout.dart';
import 'package:service_status/constants.dart';
import 'package:service_status/routes/routes.dart';

class BookedScreen extends StatelessWidget {
  const BookedScreen({
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your vehicle has been booked in for:',
              style: bodyStyle,
            ),
            kHeightSpacer,
            kHeightSpacer,
            Text(
              'We look forward to seeing you!',
              style: bodyStyle,
            ),
          ],
        ),
        Container(
          color: kPrimaryColor,
          width: 0.5,
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
        Column(
          children: [
            Text(
              time,
              style: timeStyle,
              // style: textTheme.headline1,
            ),
            Text(
              date,
              style: dateStyle,
              // style: textTheme.headline4,
            ),
          ],
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
        'Your vehicle has been booked in for:',
        style: bodyStyle,
      ),
      kHeightSpacer,
      Text(
        time,
        style: timeStyle,
        // style: textTheme.headline1,
      ),
      Text(
        date,
        style: dateStyle,
        // style: textTheme.headline4,
      ),
      kHeightSpacer,
      Text(
        'We look forward to seeing you!',
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
      title: 'Booked',
      childMainAxisAlignment: MainAxisAlignment.center,
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
