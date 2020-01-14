// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:analog_clock/components/circle_clock_display.dart';
import 'package:analog_clock/components/clock_readout.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';

/// A clock that shows the time using colourful,
/// overlapping circles that move across the screen.
class TheClock extends StatefulWidget {
  const TheClock(this.model);

  final ClockModel model;

  @override
  _TheClockState createState() => _TheClockState();
}

class _TheClockState extends State<TheClock> {
  bool get _is24hr => widget.model.is24HourFormat;

  DateTime _now = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set the initial values.
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      // Update once per second. Make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final timeText = _is24hr
        ? DateFormat.Hm().format(DateTime.now())
        : DateFormat.jm().format(DateTime.now());

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Animated circle clock reading $timeText',
        value: timeText,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CircleClockDisplay(
            timeNow: DateTime.now(),
            displaySize: MediaQuery.of(context).size,
          ),
          FractionallySizedBox(
            heightFactor: 0.12,
            widthFactor: 0.15,
            child: ClockReadout(timeText: timeText),
          ),
        ],
      ),
    );
  }
}
