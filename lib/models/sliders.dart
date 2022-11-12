import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/product-page/product_page.dart';

class SlidersStyle1 extends StatelessWidget {
  const SlidersStyle1({
    Key? key,
    required this.width,
    this.index,
  }) : super(key: key);
  final double width;
  final int? index;

  double get positionedItem {
    return width / 50;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(width / 5.53, 0),
          child: SizedBox(
            width: width / 1.8,
            height: width / 1.8,
            child: CustomPaint(
              painter: SlidersStyle1CircleGradian(
                  color: Colors.white,
                  gradiantColor: const Color(0xFF1C7CB5)), //0xFFb00b31
            ),
          ),
        ),
        SizedBox(
          width: width,
          height: width / 2.4,
          child: CustomPaint(painter: SlidersStyle1Painter()),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: width / 4 < 120 ? 120 : width / 4,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/weekly_gifts/mobile2.jpg",
                    // height: width / 5.1,
                  ),
                ),
                SizedBox(
                  width: width / 48,
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/weekly_gifts/tablet1.jpg",
                  ),
                ),
                SizedBox(width: width / 48),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/images/weekly_gifts/mobile2.jpg",
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: positionedItem / 2,
          left: positionedItem,
          child: Text(
            "Exclusive\nOffers",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(color: Colors.black, blurRadius: 5),
                ],
                color: const Color(0xFF339cd4), // 0xFF339cd4
                fontSize: doubleResponsiveSize(14, 25, 35, width)),
          ),
        ),
        Positioned(
          right: positionedItem,
          bottom: positionedItem,
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "5G Mobiles\n",
                    style: TextStyle(
                        shadows: const [
                          Shadow(color: Color(0xFF918F90), blurRadius: 5),
                        ],
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF9B0C51),
                        fontSize: doubleResponsiveSize(14, 20, 37, width))),
                TextSpan(
                    text: "AND",
                    style: TextStyle(
                      shadows: const [
                        Shadow(color: Color(0xFF6D6B6C), blurRadius: 5),
                      ],
                      color: Colors.white,
                      fontSize: doubleResponsiveSize(14, 20, 37, width),
                    )),
                TextSpan(
                    text: "\nTeblets",
                    style: TextStyle(
                      shadows: const [
                        Shadow(color: Color(0xFF6D6B6C), blurRadius: 5),
                      ],
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF9B0C51),
                      fontSize: doubleResponsiveSize(14, 20, 37, width),
                    ))
              ])),
        ),
        Positioned(
          bottom: positionedItem,
          left: positionedItem,
          child: Text(
            "35% Off",
            style: TextStyle(
                color: Colors.white,
                fontSize: doubleResponsiveSize(14, 23, 40, width)),
          ),
        ),
        Positioned(
          right: positionedItem,
          top: positionedItem,
          child: Text(
            "Only Today",
            style: TextStyle(
                color: Colors.white,
                fontSize: doubleResponsiveSize(14, 23, 40, width)),
          ),
        ),
      ],
    );
  }
}

class SlidersStyle1Painter extends CustomPainter {
  SlidersStyle1Painter({
    this.color,
  });

  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = const Color(0xFF0C669B); // 0xFFe8335d
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

  final Color? color;
  final Color? gradiantColor;

  @override
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

List advertise({double? width, int? index}) {
  return [
    SlidersStyle1(width: width!, index: index),
    SlidersStyle1(width: width, index: index),
    SlidersStyle1(width: width, index: index),
    SlidersStyle1(width: width, index: index)
  ];
}

List weeklyGift({double? width, int? index}) {
  return [
    SlidersStyle1(width: width!, index: index),
    SlidersStyle1(width: width, index: index),
    SlidersStyle1(width: width, index: index),
  ];
}
