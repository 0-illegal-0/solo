import 'dart:math';

import 'package:flutter/material.dart';

class SlidersStyle3 extends StatelessWidget {
  const SlidersStyle3({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: 150,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF6e18a3), Color(0xFFdf5afa)],
          )),
          child: CustomPaint(
            painter: SlidersStyle3Painter(color: const Color(0xFF319bcc)),
          ),
        ),
        const Positioned(
            top: 15,
            left: 70,
            child: Text(
              "Best Cameras Deals",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFffffff),
                height: 1,
              ),
            )),
        const Positioned(
          top: 65,
          left: 80,
          child: Text("Buy This Deal\nFast",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFf2bd55),
                fontSize: 18,
              )),
        ),
        Transform.translate(
          offset: Offset(-width / 6.62, width / 6.61), //-width / 6.62 //55
          child: Transform.rotate(
            angle: pi / -2,
            child: Container(
              alignment: Alignment.center,
              width: width / 2.4,
              height: width / 8.72,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "Up to ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: " 40%",
                        style: TextStyle(
                            color: Colors.white, fontSize: 22, shadows: [])),
                    TextSpan(
                        text: " off",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold))
                  ])),
            ),
          ),
        ),
        Positioned(
            right: 50,
            top: 35,
            child: Image.asset(
              "assets/images/cameras/camera1.png",
              width: 80,
            )),
        Positioned(
            right: 0,
            top: 50,
            child: Image.asset(
              "assets/images/cameras/camera2.png",
              width: 80,
            )),
      ],
    );
  }
}

class SlidersStyle3Painter extends CustomPainter {
  SlidersStyle3Painter({this.color});
  @override
  final Color? color;
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(size.width * 0.125, 0);
    path.lineTo(size.width * 0.20, size.height * 0.50);
    path.lineTo(size.width * 0.125, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
