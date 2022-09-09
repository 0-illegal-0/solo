import 'dart:math';

import 'package:flutter/material.dart';

class SpecialOfferHeader extends StatelessWidget {
  const SpecialOfferHeader({
    Key? key,
    required this.width,
    required this.topMargin,
    required this.marginTop,
    required this.semtricMargin,
    required this.shadowWidth,
    required this.shadowHeight,
    this.title,
  }) : super(key: key);

  final double? width;
  final double topMargin;
  final double marginTop;
  final double semtricMargin;
  final double shadowWidth;
  final double shadowHeight;
  final String? title;

  double get titleFontSize {
    if (width! / 20 > 45) {
      return 45;
    } else if (width! / 20 < 22) {
      return 22;
    } else {
      return width! / 20;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: width! / 8 < 60 ? 60 : width! / 8,
      child: Stack(
        children: [
          Positioned(
            top: topMargin,
            child: Container(
              height: marginTop,
              width: width! / 4.5,
              decoration: const BoxDecoration(),
              child: const CustomPaint(
                painter: SpecialOfferHeaderStyle(headColor: Color(0xFFd91e26)),
              ),
            ),
          ),
          Positioned(
            top: topMargin,
            right: 0,
            child: SizedBox(
              height: marginTop,
              width: width! / 4.5,
              child: Transform.rotate(
                angle: pi,
                child: const CustomPaint(
                  painter:
                      SpecialOfferHeaderStyle(headColor: Color(0xFFd91e26)),
                ),
              ),
            ),
          ),
          Positioned(
            left: semtricMargin,
            right: semtricMargin,
            child: Container(
              height: marginTop,
              alignment: Alignment.center,
              color: const Color(0xFFf22e36),
              child: Text(title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      shadows: const [
                        BoxShadow(
                            color: Color(0xFFf0faf5),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: Offset(0, 0))
                      ],
                      letterSpacing: 0.5,
                      fontSize: titleFontSize,
                      color: const Color(0xFFfcba03))),
            ),
          ),
          Positioned(
            top: marginTop,
            left: semtricMargin,
            child: SizedBox(
              width: shadowWidth,
              height: shadowHeight,
              child: CustomPaint(
                painter: Shadow(
                    firstPoint: shadowWidth,
                    secondPoint: shadowHeight,
                    thirdPoint: shadowWidth,
                    shadowColor: const Color.fromRGBO(163, 18, 24, 1)),
              ),
            ),
          ),
          Positioned(
            top: marginTop,
            right: semtricMargin,
            child: SizedBox(
              width: shadowWidth,
              height: shadowHeight,
              child: CustomPaint(
                painter: Shadow(
                    firstPoint: 0,
                    secondPoint: shadowHeight,
                    thirdPoint: shadowWidth,
                    shadowColor: const Color.fromRGBO(163, 18, 24, 1)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SpecialOfferHeaderStyle extends CustomPainter {
  const SpecialOfferHeaderStyle({required this.headColor});
  final Color headColor;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = headColor;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width * 0.25, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Shadow extends CustomPainter {
  Shadow(
      {this.thirdPoint,
      this.firstPoint,
      this.secondPoint,
      required this.shadowColor});
  final double? firstPoint;
  final double? secondPoint;
  final double? thirdPoint;
  final Color shadowColor;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = shadowColor;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(firstPoint!, secondPoint!);
    path.lineTo(thirdPoint!, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
