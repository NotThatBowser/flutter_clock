import 'package:analog_clock/models/circle_hand_model.dart';
import 'package:flutter/material.dart';

import 'circle_hand.dart';

class OffsetCircleHand extends StatelessWidget {
  const OffsetCircleHand({
    Key key,
    @required this.clockTheme,
    @required this.displaySize,
    @required this.handModel,
    @required this.progress,
  }) : super(key: key);

  final ThemeData clockTheme;
  final Size displaySize;
  final CircleHandModel handModel;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(progress * 100, 0.0),
      child: CircleHand(
        scale: handModel.scale,
        lightness: handModel.lightness,
      ),
    );
  }
}
