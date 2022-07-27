import 'package:flutter/material.dart';

import '../../components/date_time_text.dart';
import '../../components/outlined_elevated_button.dart';
import '../../components/screen_layout.dart';
import '../../constants.dart';
import '../../routes/routes.dart';

const _weLookForward = 'We look forward to seeing you!';
const _bookedInFor = 'Your vehicle has been booked in for:';
const _heightSpacer = SizedBox(height: 20);

class BookedScreen extends StatelessWidget {
  const BookedScreen({
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _bookedInFor,
                style: bodyStyle,
              ),
              _heightSpacer,
              Text(
                _weLookForward,
                style: bodyStyle,
              ),
            ],
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
            showDate: true,
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
        _bookedInFor,
        style: bodyStyle,
      ),
      _heightSpacer,
      DateTimeText(
        timestamp: timestamp,
        showDate: true,
      ),
      _heightSpacer,
      Text(
        _weLookForward,
        style: bodyStyle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bodyStyle = textTheme.bodyText1!.copyWith(fontSize: 18);

    return ScreenLayout(
      title: 'Booked',
      portraitBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: portraitLayout(bodyStyle: bodyStyle),
          ),
        );
      },
      landscapeBuilder: (context) => landscapeLayout(
        bodyStyle: bodyStyle,
      ),
      footer: OutlinedElevatedButton(
        onPressed: () {
          pop(context);
        },
        child: const Text('Back'),
      ),
    );
  }
}
