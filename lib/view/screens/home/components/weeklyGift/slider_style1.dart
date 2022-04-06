import 'dart:math';

import 'package:flutter/material.dart';

class SlidersStyle1 extends StatelessWidget {
  const SlidersStyle1({
    Key? key,
    required this.width,
    /*this.i*/
  }) : super(key: key);
  final double width;
  //final int? i;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFb00b31),
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(width / 5.53, 0),
            child: SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: SlidersStyle1CircleGradian(
                    color: Colors.white,
                    gradiantColor: const Color(0xFFb00b31)),
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: width / 2.4,
            child: CustomPaint(painter: SlidersStyle1Painter()),
          ),
          Positioned(
            right: 120,
            top: width / 13,
            child: Transform.rotate(
              angle: pi / 6,
              child: Image.asset(
                "assets/images/weekly_gifts/mobile2.jpg",
                height: 70,
              ),
            ),
          ),
          Positioned(
            left: 120,
            top: width / 13,
            child: Transform.rotate(
              angle: -pi / 6,
              child: Image.asset(
                "assets/images/weekly_gifts/mobile2.jpg",
                height: 70,
              ),
            ),
          ),
          Positioned(
            right: 115,
            top: width / 6,
            child: Image.asset(
              "assets/images/weekly_gifts/tablet1.jpg",
              height: 50,
              width: 100,
            ),
          ),
          const Positioned(
            top: 13,
            left: 15,
            child: Text(
              "Exclusive\nOffers",
              style: TextStyle(shadows: [
                Shadow(color: Colors.black, blurRadius: 5),
              ], color: Color(0xFF339cd4), fontSize: 21), //Color(0xFFa6330d)
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text: "5G Mobiles\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFfcba03),
                        fontSize: 18,
                      )),
                  TextSpan(
                      text: "AND",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                  TextSpan(
                      text: "\nTeblets",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFfcba03),
                        fontSize: 18,
                      ))
                ])),
          ),
          const Positioned(
            bottom: 7,
            left: 7,
            child: Text(
              "35% Off",
              style: TextStyle(
                  color: Colors.white, fontSize: 17), //Color(0xFFa6330d)
            ),
          ),
          const Positioned(
            right: 3,
            top: 3,
            child: Text(
              "Only Today",
              style: TextStyle(
                  color: Colors.white, fontSize: 17), //Color(0xFF339cd4)
            ),
          ),
        ],
      ),
    );
  }
}

class SlidersStyle1Painter extends CustomPainter {
  SlidersStyle1Painter({
    this.color,
  });
  @override
  final Color? color;
  void paint(Canvas canvas, Size size) {
    RadialGradient gradiant = const RadialGradient(
      colors: [
        Colors.white,
      ],
    );
    var paint = Paint();

    paint.color = const Color(0xFFe8335d);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.lineTo(size.width * 0.40, 0);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.10, size.width, size.height * 0.40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.20, size.height * 0.85, size.width * 0.45, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SlidersStyle1CircleGradian extends CustomPainter {
  SlidersStyle1CircleGradian({this.color, this.gradiantColor});
  @override
  final Color? color;
  final Color? gradiantColor;
  void paint(Canvas canvas, Size size) {
    RadialGradient gradiant = RadialGradient(
      colors: [
        Colors.white,
        gradiantColor!,
      ],
    );
    var paint = Paint()
      ..shader = gradiant.createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2));

    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
