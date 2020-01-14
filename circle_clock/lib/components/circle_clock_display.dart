import 'package:flutter/material.dart';
import 'package:analog_clock/config/config_hand_data.dart';

import 'offset_circle_hand.dart';

class CircleClockDisplay extends StatelessWidget {
  const CircleClockDisplay({
    Key key,
    @required this.timeNow,
    @required this.displaySize,
    @required this.isLightTheme,
  }) : super(key: key);

  final DateTime timeNow;
  final Size displaySize;
  final bool isLightTheme;

  double get secondsProgress => timeNow.second / 59.0;
  double get minutesProgress => timeNow.minute / 59.0;
  double get hoursProgress => timeNow.hour / 23.0;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: Duration(seconds: 1),
        color: getTimeBasedColor(timeNow),
        child: ClipRect(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              //? HOUR Hand
              OffsetCircleHand(
                displaySize: displaySize,
                handModel: ConfigHandData.hourHand,
                progress: hoursProgress,
              ),
              //? MINUTE Hand
              OffsetCircleHand(
                displaySize: displaySize,
                handModel: ConfigHandData.minuteHand,
                progress: minutesProgress,
              ),
              //? SECOND Hand
              OffsetCircleHand(
                displaySize: displaySize,
                handModel: ConfigHandData.secondHand,
                progress: secondsProgress,
              ),
            ],
          ),
        ),
      );

  // ----- HELPERS -----
  /// Progresses through the colour spectrum once per hour.
  Color getTimeBasedColor(DateTime time) {
    double hueProgress = 360.0 * (time.minute / 59.0);

    return HSLColor.fromAHSL(
      1.0,
      hueProgress,
      isLightTheme ? 0.65 : 0.65,
      isLightTheme ? 0.55 : 0.30,
    ).toColor();
  }
}
