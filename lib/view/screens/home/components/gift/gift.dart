import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solo/view/responsive.dart';

class Gift extends StatelessWidget {
  const Gift({Key? key, this.title, this.width}) : super(key: key);
  final String? title;
  final double? width;
  static const List<String> images = [
    "assets/images/laptops/hp-255-g8.png",
    "assets/images/cameras/camera1.png",
    "assets/images/cameras/camera1.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title!,
            style: device == DeviceType.Mobile
                ? Theme.of(context).textTheme.headline6
                : const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          height: width! / 2.1 > 330 ? 330 : width! / 2.1,
          decoration: const BoxDecoration(color: Color(0xFFd6a622), boxShadow: [
            BoxShadow(
                color: Color(0xFFba0d47),
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 0))
          ]),
          child: Stack(
            children: [
              SizedBox(
                child: CustomPaint(
                  painter: BackGroundHeader1(),
                ),
                width: double.infinity,
                height: width! / 6.7 > 53 ? 53 : width! / 6.7,
              ),
              SizedBox(
                child: CustomPaint(
                  painter: BackGroundHeader2(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Buy More Than 25.000 EGP and Get OFF 50% Dicount",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: width! / 28 > 28
                                ? 28
                                : width! / 28 < 15
                                    ? 15
                                    : width! / 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                width: double.infinity,
                height: width! / 7 > 92 ? 92 : width! / 7,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: width! / 4.76 > 135 ? 135 : width! / 4.76), //135
                width: width!,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      images.length,
                      (index) => Transform.rotate(
                        angle: pi / 4,
                        child: Container(
                          width: width! / 5.5 > 150 ? 150 : width! / 5.5, //70
                          height: width! / 5.5 > 150 ? 150 : width! / 5.5,
                          padding: EdgeInsets.all(width! / 65.8),
                          decoration: BoxDecoration(
                              color: const Color(0xFFa8a7a5), //0xFF53524f
                              border: Border.all(
                                  color: const Color(0xFFffffff), width: 3.0)),
                          child: Transform.rotate(
                            angle: -pi / 4,
                            child: Image.asset(images[index]),
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BackGroundHeader1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFFffffff); // 0xFF26a1d1   0xFFa88f32
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.lineTo(0, size.height * 0.53);
    path.lineTo(size.width * 0.30, size.height);
    path.lineTo(size.width * 0.70, size.height);
    path.lineTo(size.width, size.height * 0.53);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BackGroundHeader2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFFba0d47);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.lineTo(0, size.height * 0.50);
    path.lineTo(size.width * 0.30, size.height);
    path.lineTo(size.width * 0.70, size.height);
    path.lineTo(size.width, size.height * 0.50);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
