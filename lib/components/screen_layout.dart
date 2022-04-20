import 'package:flutter/material.dart';
import 'package:service_status/components/car_animation.dart';

import 'scaffold.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({
    required this.title,
    this.children = const [],
    this.carAnimation,
    this.childPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.childMainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.footer,
    Key? key,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final CarAnimation? carAnimation;
  final EdgeInsetsGeometry childPadding;
  final MainAxisAlignment childMainAxisAlignment;
  final Widget? footer;

  List<Widget> _children() {
    if (children.length == 1) {
      var child = children.first;

      if (childPadding.isNonNegative) {
        child = Padding(
          padding: childPadding,
          child: child,
        );
      }

      return [Expanded(child: child)];
    }

    if (childPadding.isNonNegative) {
      return children
          .map((e) => Padding(
                padding: childPadding,
                child: e,
              ))
          .toList();
    }
    return children;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: childMainAxisAlignment,
                  children: [
                    if (carAnimation != null) carAnimation!,
                    ..._children()
                  ],
                ),
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
