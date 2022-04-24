import 'package:flutter/material.dart';
import 'package:service_status/components/car_animation.dart';

import 'scaffold.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({
    required this.title,
    required this.portraitBuilder,
    this.tabletBuilder,
    this.landscapeBuilder,
    this.footer,
    Key? key,
  }) : super(key: key);

  final String title;

  /// If null, wil fallback to [portraitBuilder]
  final Widget Function(BuildContext context)? tabletBuilder;

  final Widget Function(BuildContext context) portraitBuilder;

  /// If null, wil fallback to [portraitBuilder]
  final Widget Function(BuildContext context)? landscapeBuilder;

  final Widget? footer;

  Widget _layout(BuildContext context) {
    final media = MediaQuery.of(context);

    if (media.size.height > 1000) {
      return tabletBuilder != null
          ? tabletBuilder!(context)
          : portraitBuilder(context);
    }

    if (media.orientation == Orientation.landscape &&
        landscapeBuilder != null) {
      return landscapeBuilder!(context);
    }

    return portraitBuilder(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: theme.textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: _layout(context),
              ),
              if (footer != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: footer!,
                )
            ],
          ),
        ),
      ),
    );
  }
}
