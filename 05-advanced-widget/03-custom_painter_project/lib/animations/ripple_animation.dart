import 'dart:math' as math;

import 'package:flutter/material.dart';

class RippleAnimation extends CustomPainter {
  final double value;

  RippleAnimation({
    required this.value,
  });

  void circle(Canvas canvas, Rect rect, double value) {
    final double size = rect.width;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);

    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color animateColor = Colors.black.withOpacity(opacity);
    final Paint paint = Paint()..color = animateColor;

    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 0; wave <= 3; wave++) {
      circle(canvas, rect, wave + value);
    }
  }

  @override
  bool shouldRepaint(covariant RippleAnimation oldDelegate) {
    return value != oldDelegate.value;
  }
}
