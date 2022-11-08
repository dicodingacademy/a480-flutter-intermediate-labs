import 'dart:math' as math;

import 'package:flutter/material.dart';

class PacmanAnimation extends CustomPainter {
  final Color color;
  final double value;
  final double width;
  final double height;
  PacmanAnimation({
    required this.color,
    required this.value,
    required this.width,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Rect rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: width,
      height: height,
    );

    canvas.drawArc(
      rect,
      math.pi,
      math.pi / value,
      true,
      paint,
    );
    canvas.drawArc(
      rect,
      -math.pi,
      -math.pi / value,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant PacmanAnimation oldDelegate) {
    return color != oldDelegate.color || value != oldDelegate.value;
  }
}
