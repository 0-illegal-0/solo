import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo/models/add_main_data.dart';
import 'package:solo/view/responsive.dart';
import 'package:solo/view/screens/product-page/product_page.dart';

class SlidersStyle2 extends StatelessWidget {
  const SlidersStyle2({Key? key, required this.width, this.index})
      : super(key: key);
  final double width;
  final int? index;

  double get textPostition {
    return width / 36;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFcf9e0c),
      child: InkWell(
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
            SizedBox(
                width: double.infinity,
                height: width * 0.22 < 140 ? 140 : width * 0.22,
                child: CustomPaint(
                    painter: SlidersStyle2Painter(color: Colors.green))),
            Transform.translate(
              offset: Offset(width / 15.4, width / 33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Big Sale",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: doubleResponsiveSize(14, 26, 23, width),
                            fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Text("HD Smart TV",
                        style: TextStyle(
                            color: const Color(0xff0cb7c9),
                            fontSize: doubleResponsiveSize(14, 20, 27, width),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Positioned(
              right: width / 96,
              child: Container(
                  margin: EdgeInsets.only(top: width / 96),
                  width: doubleResponsiveSize(
                      42, 80, 11, width), //width / 10 < 40 ? 40 : width / 10,
                  height: doubleResponsiveSize(42, 80, 11, width),
                  //padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFb00b31)),
                  child: Text(
                    "UP TO\n30%\nOFF ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1,
                        fontSize: doubleResponsiveSize(10, 18, 50, width)),
                  )),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: width / 7),
              child: Image.asset("assets/images/tv/tv2.png",
                  width: doubleResponsiveSize(90, 270, 4.4, width)),
            )
          ],
        ),
      ),
    );
  }
}

class SlidersStyle2Painter extends CustomPainter {
  SlidersStyle2Painter({this.color});
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0xFFb00b31);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.lineTo(size.width * 0.33, 0);
    path.lineTo(size.width * 0.50, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
