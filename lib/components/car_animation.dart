import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../constants.dart';

class CarAnimation extends StatelessWidget {
  const CarAnimation({
    required this.isPlaying,
    required this.controller,
    this.onInit,
    Key? key,
  }) : super(key: key);

  final bool isPlaying;
  final RiveAnimationController controller;
  final void Function(Artboard artboard)? onInit;

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);

    // final isLandscape = mediaQuery.orientation == Orientation.landscape;
    // final imageWidth =
    //     (isLandscape ? mediaQuery.size.height : mediaQuery.size.width) - 10;
    // final imageStart =
    //     isLandscape ? (mediaQuery.size.width / 2) - imageWidth / 2 : 0.0;

    return LayoutBuilder(builder: (context, constraints) {
      final imageWidth = constraints.maxWidth;

      return SizedBox(
        height: imageWidth / 2.9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedPositioned(
              duration: isPlaying ? kTransitionDuration : Duration.zero,
              left: isPlaying ? constraints.maxWidth : 0,
              child: SizedBox(
                width: imageWidth,
                height: imageWidth / 3,
                child: RiveAnimation.asset(
                  kCarRive,
                  controllers: [controller],
                  onInit: onInit,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
