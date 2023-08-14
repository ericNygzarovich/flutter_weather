import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HorizontalDisplayOfDegrees extends CustomPainter {
  final bool currenTempMarker;

  HorizontalDisplayOfDegrees(this.currenTempMarker);

  final Offset start = const Offset(10, 0);
  final Offset end = const Offset(80, 0);

  void _background(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.style = PaintingStyle.fill;
    backgroundPaint.color = const Color.fromRGBO(81, 67, 85, 1);
    backgroundPaint.strokeCap = StrokeCap.round;
    backgroundPaint.strokeWidth = 7;

    canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), backgroundPaint);
  }

  void _temperatureLine(Canvas canvas, Size size) {
    final temperatureLinePaint = Paint();
    temperatureLinePaint.style = PaintingStyle.fill;
    temperatureLinePaint.strokeCap = StrokeCap.round;
    temperatureLinePaint.shader = ui.Gradient.linear(start, end, [
      Colors.amber,
      Colors.deepOrange
    ]);
    temperatureLinePaint.strokeWidth = 7;

    canvas.drawLine(start, end, temperatureLinePaint);
  }

  void _currentTempMarker(Canvas canvas, Size size) {
    final currentTempMarkerBorder = Paint();
    currentTempMarkerBorder.style = PaintingStyle.stroke;
    currentTempMarkerBorder.color = const Color.fromRGBO(81, 67, 85, 1);
    currentTempMarkerBorder.strokeWidth = 2;

    final currentTempMarkerFill = Paint();
    currentTempMarkerFill.style = PaintingStyle.fill;
    currentTempMarkerFill.color = Colors.white;

    canvas.drawOval(Rect.fromCircle(center: const Offset(20, 0), radius: 3), currentTempMarkerBorder);
    canvas.drawOval(Rect.fromCircle(center: const Offset(20, 0), radius: 2), currentTempMarkerFill);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _background(canvas, size);
    _temperatureLine(canvas, size);
    if (currenTempMarker) {
      _currentTempMarker(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
