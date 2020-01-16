// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:analog_clock/components/circle_clock_display.dart';
import 'package:analog_clock/components/clock_readout.dart';
import 'package:flutter/services.dart';
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
  DateTime _now = DateTime.now();
  Timer _timer;
  bool _is24hr;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    // Set initial values.
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(TheClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theTime = DateTime.now();
    final timeText = _is24hr
        ? DateFormat.Hm().format(theTime)
        : DateFormat.jm().format(theTime);

    // An animated clock fills the screen and is overlayed with a text readout.
    //! Report semantics here & exclude subtree to avoid duplicate information.
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'A clock reading $timeText',
      ),
      child: ExcludeSemantics(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CircleClockDisplay(
              timeNow: theTime,
              displaySize: MediaQuery.of(context).size,
              isLightTheme: Theme.of(context).brightness == Brightness.light,
            ),
            ClockReadout(
              timeText: timeText,
              fontSize: 22.0,
              padding: const EdgeInsets.only(bottom: 8.0),
            ),
          ],
        ),
      ),
    );
  }

  // ----- HELPERS -----
  void _updateModel() => setState(() => _is24hr = widget.model.is24HourFormat);

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
}
