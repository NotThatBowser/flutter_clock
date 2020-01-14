import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ClockReadout extends StatelessWidget {
  const ClockReadout({
    Key key,
    @required this.timeText,
  }) : super(key: key);

  final String timeText;

  final String _fontFamily = "Quicksand";
  final double _fontSize = 100.0;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        //! Outlined text
        children: <Widget>[
          AutoSizeText(
            timeText,
            minFontSize: 10.0,
            maxFontSize: _fontSize,
            stepGranularity: 10.0,
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
          AutoSizeText(
            timeText,
            minFontSize: 10.0,
            maxFontSize: _fontSize,
            stepGranularity: 10.0,
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
