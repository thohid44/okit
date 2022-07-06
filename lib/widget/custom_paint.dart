import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()..strokeWidth = 10;

    canvas.drawLine(Offset(50, 150), Offset(150, 220), linePaint);
    canvas.drawLine(
        Offset(size.width - 50, 150), Offset(size.width - 150, 220), linePaint);

    Paint circlePaint = Paint();
    canvas.drawCircle(Offset(100, 250), 20, circlePaint);
    canvas.drawCircle(Offset(size.width - 100, 250), 20, circlePaint);

    Paint arcPaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    Rect rect = Rect.fromLTWH(80, 350, 220, 300);
    canvas.drawArc(rect, math.pi, math.pi, true, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}