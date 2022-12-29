import 'dart:math' as math;
import 'package:flutter/material.dart';

class LoaderAnimation extends CustomPainter {
  final double radiusRatio;

  LoaderAnimation({
    required this.radiusRatio,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 4, circle);

    Paint arc = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    Rect rect = Rect.fromCenter(
        center: center,
        width: size.width / 2 * radiusRatio,
        height: size.height / 2 * radiusRatio);

    canvas.drawArc(
      rect,
      math.pi / 4,
      math.pi / 2,
      false,
      arc,
    );
    canvas.drawArc(
      rect,
      -math.pi / 4,
      -math.pi / 2,
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(covariant LoaderAnimation oldDelegate) {
    return radiusRatio != oldDelegate.radiusRatio;
  }
}
