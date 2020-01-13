import 'package:flutter/material.dart';

class ClockReadout extends StatelessWidget {
  const ClockReadout({
    Key key,
    @required this.timeText,
  }) : super(key: key);

  final String timeText;

  @override
  Widget build(BuildContext context) => Stack(
        //! Outlined text
        children: <Widget>[
          Text(
            timeText,
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Quicksand",
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.0
                ..color = Colors.grey[600],
            ),
          ),
          Text(
            timeText,
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Quicksand",
              color: Colors.white,
            ),
          ),
        ],
      );
}
