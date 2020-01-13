import 'package:analog_clock/models/circle_hand_model.dart';
import 'package:flutter/material.dart';

import 'circle_hand.dart';

class OffsetCircleHand extends StatelessWidget {
  const OffsetCircleHand({
    Key key,
    @required this.displaySize,
    @required this.handModel,
    @required this.progress,
  }) : super(key: key);

  final Size displaySize;
  final CircleHandModel handModel;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.elasticOut,
      duration: Duration(milliseconds: handModel.animationMs),
      transform: Matrix4.translationValues(
        (progress - 0.5) * (displaySize.width),
        0.0,
        0.0,
      ),
      child: CircleHand(
        scale: handModel.scale,
        lightness: handModel.lightness,
      ),
    );
  }
}
