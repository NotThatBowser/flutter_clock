import 'package:flutter/material.dart';

class ClockReadout extends StatelessWidget {
  const ClockReadout({
    Key key,
    @required this.timeText,
    @required this.fontSize,
    @required this.padding,
    this.fontFamily = "Quicksand",
  }) : super(key: key);

  final String timeText;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final String fontFamily;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Stack(
          alignment: Alignment.bottomCenter,
          // Outlined text to improve readability on any background.
          // Draw an outline of the text below the text itself.
          children: <Widget>[
            Text(
              timeText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: fontFamily,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1.5
                  ..color = Colors.grey[600],
              ),
            ),
            Text(
              timeText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: fontFamily,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
