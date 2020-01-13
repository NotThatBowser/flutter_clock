import 'package:flutter/material.dart';
import 'package:analog_clock/config/config_hand_data.dart';

import 'offset_circle_hand.dart';

class CircleClockDisplay extends StatelessWidget {
  const CircleClockDisplay({
    Key key,
    @required this.timeNow,
    @required this.clockTheme,
    @required this.displaySize,
  }) : super(key: key);

  final DateTime timeNow;
  final ThemeData clockTheme;
  final Size displaySize;

  double get secondsProgress => timeNow.second / 59.0;
  double get minutesProgress => timeNow.minute / 59.0;
  double get hoursProgress => timeNow.hour / 23.0;

  @override
  Widget build(BuildContext context) => ClipRect(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            //? HOUR Hand
            OffsetCircleHand(
              clockTheme: clockTheme,
              displaySize: displaySize,
              handModel: ConfigHandData.hourHand,
              progress: hoursProgress,
            ),
            //? MINUTE Hand
            OffsetCircleHand(
              clockTheme: clockTheme,
              displaySize: displaySize,
              handModel: ConfigHandData.minuteHand,
              progress: minutesProgress,
            ),
            //? SECOND Hand
            OffsetCircleHand(
              clockTheme: clockTheme,
              displaySize: displaySize,
              handModel: ConfigHandData.secondHand,
              progress: secondsProgress,
            ),
          ],
        ),
      );
}
