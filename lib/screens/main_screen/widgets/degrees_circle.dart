import 'dart:math';

import 'package:flutter/material.dart';

class DegreesCircle extends CustomPainter {
  final double size;
  final double width;
  final Color color;

  DegreesCircle({
    required this.color,
    required this.size,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = width;

    canvas.drawArc(
      const Offset(0, 0) & Size(this.size, this.size),
      pi,
      pi * 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
