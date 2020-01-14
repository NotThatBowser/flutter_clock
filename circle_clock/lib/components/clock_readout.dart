import 'package:flutter/material.dart';

class ClockReadout extends StatelessWidget {
  const ClockReadout({
    Key key,
    @required this.timeText,
  }) : super(key: key);

  final String timeText;

  final String _fontFamily = "Quicksand";
  final double _fontSize = 26.0;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        //! Outlined text
        children: <Widget>[
          Text(
            timeText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: _fontSize,
              fontFamily: _fontFamily,
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
              fontSize: _fontSize,
              fontFamily: _fontFamily,
              color: Colors.white,
            ),
          ),
        ],
      );
}
