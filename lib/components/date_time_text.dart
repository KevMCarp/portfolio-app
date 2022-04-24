import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:service_status/constants.dart';

class DateTimeText extends StatelessWidget {
  const DateTimeText({
    this.caption,
    required this.timestamp,
    this.showDate = false,
    Key? key,
  }) : super(key: key);

  final String? caption;
  final DateTime timestamp;
  final bool showDate;

  String get _date => DateFormat('dd/MM/yyyy').format(timestamp);
  TextStyle _dateStyle(ThemeData theme) => theme.textTheme.headline5!;
  String get _time => DateFormat('hh:mm').format(timestamp);
  TextStyle _timeStyle(ThemeData theme) => theme.textTheme.headline1!;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        if (caption != null) ...[
          Text(caption!),
          kHeightSpacer,
        ],
        Text(
          _time,
          style: _timeStyle(theme),
        ),
        if (showDate)
          Text(
            _date,
            style: _dateStyle(theme),
          ),
      ],
    );
  }
}
