import 'package:analog_clock/models/circle_hand_model.dart';

class ConfigHandData {
  static const hourHand = CircleHandModel(
    scale: 1.3,
    lightness: 0.25,
    animationMs: 4900,
  );
  static const minuteHand = const CircleHandModel(
    scale: 0.6,
    lightness: 0.50,
    animationMs: 2900,
  );
  static const secondHand = const CircleHandModel(
    scale: 0.1,
    lightness: 0.75,
    animationMs: 900,
  );
}
