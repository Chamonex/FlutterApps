import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyCircularIndicator extends StatefulWidget {
  int currentSeconds;
  int totalSeconds;
  double percentage = 0.0;

  MyCircularIndicator({
    super.key,
    required this.currentSeconds,
    required this.totalSeconds,
  }) {
    percentage = currentSeconds / totalSeconds;
  }

  @override
  State<MyCircularIndicator> createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<MyCircularIndicator> {

  Color getColor() {
    if (widget.percentage < 0.3) {
      return Colors.red;
    }
    else if (widget.percentage < 0.5) {
      return Colors.yellow;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 20.0,
      percent: widget.percentage,
      center: new Text(
        widget.percentage.toString(),
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      progressColor: getColor(),
    );
  }
}

