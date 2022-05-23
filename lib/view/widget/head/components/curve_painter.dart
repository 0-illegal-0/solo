import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  CurvePainter({this.color});
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.70,
        size.width / 2, size.height * 0.80);

    path.quadraticBezierTo(
        size.width * 0.80, size.height * 0.70, size.width, size.height * 0.70);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
