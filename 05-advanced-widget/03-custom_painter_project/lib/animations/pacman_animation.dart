import 'dart:math' as math;

import 'package:flutter/material.dart';

class PacmanAnimation extends CustomPainter {
  final double value;

  PacmanAnimation({
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.yellow;
    Rect rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width,
      height: size.height,
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
    return value != oldDelegate.value;
  }
}
