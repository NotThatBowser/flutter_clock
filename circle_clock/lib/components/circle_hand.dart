import 'package:flutter/material.dart';

class CircleHand extends StatelessWidget {
  const CircleHand({
    Key key,
    @required this.scale,
    @required this.lightness,
  }) : super(key: key);

  final double scale;
  final double lightness;

  @override
  Widget build(BuildContext context) => Transform.scale(
        scale: scale,
        child: Container(
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.difference,
            color: HSLColor.fromAHSL(1.0, 0.0, 0.0, lightness).toColor(),
            shape: BoxShape.circle,
          ),
        ),
      );
}
