import 'package:flutter/material.dart';

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 3, size.height / 3);
    Rect rect = Rect.fromCircle(center: center, radius: 70.0);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
