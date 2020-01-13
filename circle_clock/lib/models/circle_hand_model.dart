import 'package:flutter/widgets.dart';

class CircleHandModel {
  const CircleHandModel({
    @required this.scale,
    @required this.lightness,
    @required this.animationMs,
  });

  final double scale;
  final double lightness;
  final int animationMs;
}
