import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/product-page/product_page.dart';

class SlidersStyle3 extends StatelessWidget {
  const SlidersStyle3({Key? key, required this.width, this.index})
      : super(key: key);
  final double width;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => ProductPage(
                  category: solo.product[index!],
                  width: width,
                  aspectRatio: solo.product[index!].aspectRatio,
                  height: solo.product[index!].height,
                ),
            preventDuplicates: false);
        Get.deleteAll();
      },
      child: Stack(
        children: [
          Container(
            width: width,
            height: width * 0.28 < 140 ? 140 : width * 0.28,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF6e18a3), Color(0xFFdf5afa)],
            )),
            child: CustomPaint(
              painter: SlidersStyle3Painter(color: const Color(0xFF319bcc)),
            ),
          ),
          Positioned(
              top: width * 0.28 < 140 ? 15 : width / 24,
              left: width / 5.1,
              child: Text(
                "Best Cameras Deals",
                style: TextStyle(
                  fontSize:
                      doubleResponsiveSize(18, 200, 55, width, forMobile: 15),
                  color: const Color(0xFFffffff),
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              )),
          Positioned(
            top: width * 0.28 < 140 ? 65 : width / 8.53,
            left: width / 4.5,
            child: Text("Buy This Deal\nFast",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFf2bd55),
                  fontSize:
                      doubleResponsiveSize(14, 23, 24, width, forMobile: 14.0),
                )),
          ),
          Transform.translate(
            offset: Offset(-width / 6.62, 0),
            child: Transform.rotate(
              angle: pi / -2,
              child: Container(
                alignment: Alignment.center,
                width: width / 2.4,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Up to ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.28 < 140 ? 19 : width / 35,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " 40%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.28 < 140 ? 19 : width / 35,
                          )),
                      TextSpan(
                          text: " off",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width * 0.28 < 140 ? 19 : width / 35,
                              fontWeight: FontWeight.bold))
                    ])),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/cameras/camera1.png",
                  width: doubleResponsiveSize(50, 150, 7.2, width),
                ),
                Image.asset(
                  "assets/images/cameras/camera2.png",
                  width: doubleResponsiveSize(67, 150, 5.3, width),
                )
              ],
            ),
          )
        ],
      ),
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
