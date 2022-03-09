import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xFF06a7bf); // 0xFF26a1d1   0xFFa88f32
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.55, size.width / 2, size.height);

    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.55, size.width, size.height * 0.60);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
