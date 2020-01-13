import 'package:analog_clock/models/circle_hand_model.dart';

class ConfigHandData {
  static const hourHand = CircleHandModel(1.2, 0.25, 4900);
  static const minuteHand = const CircleHandModel(0.6, 0.50, 1900);
  static const secondHand = const CircleHandModel(0.1, 0.75, 900);
}
