import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/screens/product-page/product_page.dart';
import '../../../../style.dart';

class Gift extends StatelessWidget {
  const Gift(
      {Key? key,
      this.title,
      this.width,
      this.imageList,
      this.textBanner,
      this.productIndex})
      : super(key: key);
  final String? title, textBanner;
  final double? width;
  final List<String>? imageList;
  final int? productIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/product-page",
            arguments: {"index": productIndex, "width": width},
            preventDuplicates: false);
        Get.deleteAll();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title!, style: titleStyle),
          ),
          Container(
            width: double.infinity,
            height: width! / 2.1 > 330 ? 330 : width! / 2.1,
            decoration:
                const BoxDecoration(color: Color(0xFFd6a622), boxShadow: [
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
                          textBanner!,
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
                        imageList!.length,
                        (index) => Transform.rotate(
                          angle: pi / 4,
                          child: Container(
                            width: width! / 5.5 > 150 ? 150 : width! / 5.5, //70
                            height: width! / 5.5 > 150 ? 150 : width! / 5.5,
                            padding: EdgeInsets.all(width! / 65.8),
                            decoration: BoxDecoration(
                                color: const Color(0xFFa8a7a5),
                                border: Border.all(
                                    color: const Color(0xFFffffff),
                                    width: 3.0)),
                            child: Transform.rotate(
                              angle: -pi / 4,
                              child: Image.asset(imageList![index]),
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackGroundHeader1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFFffffff);
    paint.style = PaintingStyle.fill;

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
