import 'package:flutter/material.dart';

class ClockReadout extends StatelessWidget {
  const ClockReadout({
    Key key,
    @required this.timeText,
  }) : super(key: key);

  final String timeText;

  final double _fontSize = 16;

  @override
  Widget build(BuildContext context) => Stack(
        //! Outlined text
        children: <Widget>[
          Text(
            timeText,
            style: TextStyle(
              fontSize: _fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.5
                ..color = Colors.grey[600],
            ),
          ),
          Text(
            timeText,
            style: TextStyle(
              fontSize: _fontSize,
              color: Colors.white,
            ),
          ),
        ],
      );
}
