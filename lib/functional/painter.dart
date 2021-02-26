import 'dart:ui';
import 'package:ColorSwap/constants.dart';
import 'package:flutter/material.dart';

class WindowPaint extends CustomPainter {
  var offsets;
  Function clear;
  WindowPaint({
    this.offsets,
  }) : super();

  ///implement a custom painter
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorPaint
      ..strokeWidth = 2.0
      ..isAntiAlias = true;

    ///draws lines by points that it receives from user touches on the screen
    for (var i = 0; i < offsets.length - 1; i++) {
      if (offsets[i] != null && offsets[i + 1] != null) {
        canvas.drawLine(offsets[i], offsets[i + 1], paint);
      } else if (offsets[i] != null && offsets[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [offsets[i]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
