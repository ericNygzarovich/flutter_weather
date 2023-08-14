import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../models/week_forecast_parametrs.dart';

class HorizontalDisplayOfDegrees extends CustomPainter {
  final int thisDayMaxTemp;
  final int thisDayMinTemp;
  final WeekForecastParametrs renderParametrs;
  final int currentTempValue;

  HorizontalDisplayOfDegrees(
    this.currentTempValue, {
    required this.renderParametrs,
    required this.thisDayMaxTemp,
    required this.thisDayMinTemp,
  });

  void _background(Canvas canvas, Size size, Offset start, Offset end) {
    final backgroundPaint = Paint();
    backgroundPaint.style = PaintingStyle.fill;
    backgroundPaint.color = const Color.fromRGBO(81, 67, 85, 1);
    backgroundPaint.strokeCap = StrokeCap.round;
    backgroundPaint.strokeWidth = 7;

    canvas.drawLine(start, end, backgroundPaint);
  }

  void _temperatureLine(Canvas canvas, Size size, Offset start, Offset end) {
    final temperatureLinePaint = Paint();
    temperatureLinePaint.style = PaintingStyle.fill;
    temperatureLinePaint.strokeCap = StrokeCap.round;
    temperatureLinePaint.shader = ui.Gradient.linear(
      start,
      end,
      [
        Colors.amber,
        Colors.deepOrange
      ],
    );

    temperatureLinePaint.strokeWidth = 7;

    canvas.drawLine(start, end, temperatureLinePaint);
  }

  void _currentTempMarker(Canvas canvas, Size size, double currentPosition) {
    final currentTempMarkerBorder = Paint();
    currentTempMarkerBorder.style = PaintingStyle.stroke;
    currentTempMarkerBorder.color = const Color.fromRGBO(81, 67, 85, 1);
    currentTempMarkerBorder.strokeWidth = 2;

    final currentTempMarkerFill = Paint();
    currentTempMarkerFill.style = PaintingStyle.fill;
    currentTempMarkerFill.color = Colors.white;

    canvas.drawOval(
      Rect.fromCircle(center: Offset(currentPosition, 0), radius: 3),
      currentTempMarkerBorder,
    );
    canvas.drawOval(
      Rect.fromCircle(center: Offset(currentPosition, 0), radius: 2),
      currentTempMarkerFill,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    double step = size.width / renderParametrs.difference;

    final start = Offset(step * (thisDayMinTemp - renderParametrs.minTempBehindWeek + 1), 0);
    final end = Offset(step * (renderParametrs.difference - (renderParametrs.maxTempBehindWeek - thisDayMaxTemp)), 0);

    int differensThisDayTemp = thisDayMaxTemp - thisDayMinTemp;
    double stepForMarker = (end.dx - start.dx) / differensThisDayTemp;

    _background(canvas, size, Offset(step, 0), Offset(step * renderParametrs.difference, 0));
    _temperatureLine(canvas, size, start, end);
    if (currentTempValue != 0) {
      _currentTempMarker(
        canvas,
        size,
        stepForMarker * (differensThisDayTemp - (thisDayMaxTemp - currentTempValue) + 1),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
